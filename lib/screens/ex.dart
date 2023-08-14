import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/ModelProvider.dart';
import '../screens/video_screen.dart';

class Ex extends StatefulWidget {
  const Ex({super.key});

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: queryPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData) {
              final posts = snapshot.data as List<Post>;
              //final photoPosts = posts.where((post) => post.is_photo!).toList();
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  Future<String> mediaUrlFuture;
                  Future<String> thumpnailUrlFuture;
                  if (post.is_photo!) {
                    if (post.post_key != null) {
                      mediaUrlFuture = getMediaUrl(post.post_key!);
                      thumpnailUrlFuture = Future.value('');
                    } else {
                      mediaUrlFuture = Future.value('');
                      thumpnailUrlFuture = Future.value('');
                    }
                  } else {
                    if (post.thumbnail_key != null) {
                      thumpnailUrlFuture = getThumbnailUrl(post.thumbnail_key!);
                      mediaUrlFuture = getMediaUrl(post.post_key!);
                    } else {
                      thumpnailUrlFuture = Future.value('');
                      mediaUrlFuture = getMediaUrl(post.post_key!);
                    }
                  }
                  if (post.is_photo!) {
                    return FutureBuilder(
                      future: mediaUrlFuture,
                      builder: (context, mediaSnapshot) {
                        if (mediaSnapshot.hasError) {
                          return Text('Something went wrong');
                        } else if (mediaSnapshot.hasData) {
                          final mediaUrl = mediaSnapshot.data as String;
                          return ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: mediaUrl,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            title: Text("post.title"),
                            subtitle: Text(post.content!),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    );
                  } else {
                    return FutureBuilder(
                      future: thumpnailUrlFuture,
                      builder: (context, thumbnailSnapshot) {
                        if (thumbnailSnapshot.hasError) {
                          return Text('Something went wrong');
                        } else if (thumbnailSnapshot.hasData) {
                          final thumbnailUrl = thumbnailSnapshot.data as String;
                          return FutureBuilder(
                            future: mediaUrlFuture,
                            builder: (context, mediaSnapshot) {
                              if (mediaSnapshot.hasError) {
                                return Text('Something went wrong');
                              } else if (mediaSnapshot.hasData) {
                                final mediaUrl = mediaSnapshot.data as String;
                                return ListTile(
                                  leading: CachedNetworkImage(
                                    imageUrl: thumbnailUrl,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  title: Text("post.title"),
                                  subtitle: Text(post.content!),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => VideoDetailScreen(
                                          videoUrl: mediaUrl,
                                          // thumbnailUrl: thumbnailUrl,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    );
                  }
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<List<Post>> queryPosts() async {
    try {
      final posts = await Amplify.DataStore.query(Post.classType);
      return posts;
    } on DataStoreException catch (e) {
      print('Something went wrong querying posts: ${e.message}');
      rethrow;
    }
  }

  Future<String> getMediaUrl(String key) async {
    try {
      final result = await Amplify.Storage.getUrl(key: key).result;
      return result.url.toString(); // URL null ise boş string döndür
    } on StorageException catch (e) {
      print('Something went wrong getting media url: ${e.message}');
      return '';
    }
  }

  Future<String> getThumbnailUrl(String key) async {
    try {
      final result = await Amplify.Storage.getUrl(key: key).result;
      return result.url.toString();
    } on StorageException catch (e) {
      print('Something went wrong getting media url: ${e.message}');
      return '';
    }
  }
}
