import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/ModelProvider.dart';
import '../screens/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: FutureBuilder<List<Post>>(
        future: queryPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data![index];
                  return _buildPostCard(context, post);
                },
              );
            } else {
              return Center(child: Text('No posts yet!'));
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else
            return Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }
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

Widget _buildPostCard(BuildContext context, Post post) {
  return Card(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              post.pp_key != null ? getMediaUrl(post.pp_key!).toString() : '',
            ),
          ),
          title: Text(post.owner_username!),
        ),
        post.is_photo!
            ? CachedNetworkImage(
                imageUrl: getMediaUrl(post.post_key!).toString(),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VideoDetailScreen(
                      videoUrl: getMediaUrl(post.post_key!).toString(),
                    ),
                  ));
                },
                child: CachedNetworkImage(
                  imageUrl: getThumbnailUrl(post.thumbnail_key!).toString(),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
        SizedBox(height: 10),
        Text(post.content!),
        SizedBox(height: 10),
        Text(post.tag!.join(', ')),
      ],
    ),
  );
}
