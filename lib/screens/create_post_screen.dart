import 'dart:io';
import 'dart:typed_data';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_common/vm.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application/models/ModelProvider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  void initState() {
    super.initState();
    _tagController = TextEditingController();
    _instrumentController = TextEditingController();
    getGenresAndInstruments();
  }

  @override
  void dispose() {
    _disposeVideoPlayer(); // Sayfa kapatıldığında video player'ı temizleme
    _tagController?.dispose();
    _instrumentController?.dispose();
    super.dispose();
  }

  final List<String> _instruments = [];
  List<String> _availableInstruments = [];
  final List<String> _tags = [];
  List<String> _availableTags = [];
  TextEditingController? _tagController;
  TextEditingController? _instrumentController;
  File? _videoFile;
  Uint8List? _imageBytes;
  bool _isPhotoSelected = true;
  String _postText = '';
  String _selectedFilePath = '';
  VideoPlayerController? _videoPlayerController;
  String? _picKey = "";
  String? _videoKey = "";
  bool _isUploading = false;
  void _toggleMediaType(bool isPhoto) {
    setState(() {
      _isPhotoSelected = isPhoto;
      _selectedFilePath = ''; // Seçilen dosyanın sıfırlanması
      _disposeVideoPlayer(); // Video önizleme durumunu temizleme
    });
  }

  Future<void> _selectFile(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Fotoğraf'),
              onTap: () {
                Navigator.pop(context);
                _toggleMediaType(true);
                _pickFile(FileType.custom, ['jpg', 'jpeg', 'png', 'gif']);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Video'),
              onTap: () {
                Navigator.pop(context);
                _toggleMediaType(false);
                _pickFile(FileType.custom, ['mp4']);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickFile(
      FileType fileType, List<String> allowedExtensions) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path!;
        if (!_isPhotoSelected &&
            fileType == FileType.custom &&
            allowedExtensions.contains('mp4')) {
          _initializeVideoPlayer(); // Video seçildiyse video önizleme başlatma
        }
      });
    }
  }

  void _initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.file(File(_selectedFilePath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _disposeVideoPlayer() {
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
      _videoPlayerController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Oluştur'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _selectFile(context),
                    child: const Text('Dosya Seç'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              if (!_isPhotoSelected)
                _selectedFilePath.isNotEmpty
                    ? _videoPlayerController != null &&
                            _videoPlayerController!.value.isInitialized
                        ? Column(
                            children: [
                              AspectRatio(
                                aspectRatio:
                                    _videoPlayerController!.value.aspectRatio,
                                child: VideoPlayer(_videoPlayerController!),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_videoPlayerController!.value.isPlaying) {
                                    _videoPlayerController!.pause();
                                  } else {
                                    _videoPlayerController!.play();
                                  }
                                },
                                child: Icon(
                                  _videoPlayerController!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                              ),
                            ],
                          )
                        : const CircularProgressIndicator()
                    : Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Center(child: Text('Video Seçiniz')),
                      )
              else
                _selectedFilePath.isNotEmpty
                    ? Image.file(
                        File(_selectedFilePath),
                        height: 200,
                      )
                    : Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Center(child: Text('Fotoğraf Seçiniz')),
                      ),
              const SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _postText = value;
                  });
                },
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Paylaşmak istediğiniz şey...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _availableTags.where((String option) {
                    return option
                        .toLowerCase()
                        .startsWith(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  setState(() {
                    _tags.add(selection);
                    _tagController?.clear();
                  });
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  _tagController = fieldController;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: fieldController,
                        focusNode: focusNode,
                        onChanged: (value) {
                          // Implement your onChanged logic here if needed
                        },
                        decoration: const InputDecoration(
                          hintText: 'Tag ekleyin (örn: pop, rock, indie)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Wrap(
                        spacing: 8.0,
                        children: _tags.map((tag) {
                          return Chip(
                            label: Text(tag),
                            onDeleted: () {
                              setState(() {
                                _tags.remove(tag);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16.0),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _availableInstruments.where((String option) {
                    return option
                        .toLowerCase()
                        .startsWith(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  setState(() {
                    _instruments.add(selection);
                    _instrumentController?.clear();
                  });
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  _instrumentController = fieldController;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: fieldController,
                        focusNode: focusNode,
                        onChanged: (value) {
                          // Implement your onChanged logic here if needed
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enstrüman ekleyin',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Wrap(
                        spacing: 8.0,
                        children: _instruments.map((instrument) {
                          return Chip(
                            label: Text(instrument),
                            onDeleted: () {
                              setState(() {
                                _instruments.remove(instrument);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isUploading = true;
                  });

                  await _createPost();

                  setState(() {
                    _isUploading = false;
                  });
                },
                child: _isUploading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text('Paylaş'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File?> compressVideo(File video) async {
    final result = await VideoCompress.compressVideo(
      video.path,
      quality: VideoQuality.LowQuality,
    );
    return result?.file;
  }

  Future<Uint8List?> compressImage(File image) async {
    final result = await FlutterImageCompress.compressWithFile(
      image.path,
      quality: 90,
      minWidth: 400,
      minHeight: 400,
    );
    return result;
  }

  Future<void> _compress() async {
    if (_isPhotoSelected) {
      _imageBytes = await compressImage(File(_selectedFilePath));
    } else {
      _videoFile = await compressVideo(File(_selectedFilePath));
    }
  }

  Future<void> _createPost() async {
    await _compress();
    final item = await Amplify.Auth.getCurrentUser();
    if (_isPhotoSelected) {
      _picKey = "posts/images/${item.username}.jpg";
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          Stream.fromIterable(_imageBytes!.map((e) => [e])),
          size: _imageBytes!.length,
        ),
        key: _picKey!,
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;
      safePrint('Successfully uploaded file: ${result.uploadedItem.key}');
    } else {
      _videoKey = "posts/videos/${item.username}";
      final awsFile = AWSFilePlatform.fromFile(_videoFile!);
      final result = await Amplify.Storage.uploadFile(
        localFile: awsFile,
        key: _videoKey!,
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;
      safePrint('Successfully uploaded file: ${result.uploadedItem.key}');
    }
    final post = Post(
      userID: item.userId,
      content: _postText,
      pic_key: _picKey!,
      video_key: _videoKey!,
      instrument: _instruments,
      style: _tags,
    );
    await Amplify.DataStore.save(post);
  }

  Future<void> getGenresAndInstruments() async {
    try {
      final styles = await Amplify.DataStore.query(Style.classType);
      final instruments = await Amplify.DataStore.query(Instrument.classType);

      setState(() {
        _availableTags = styles.expand((style) => style.style_name!).toList();
        _availableInstruments = instruments
            .expand((instrument) => instrument.instrument_name!)
            .toList();
      });
    } on DataStoreException catch (e) {
      safePrint(
          'Something went wrong querying genres and instruments: ${e.message}');
    }
  }
}
