import 'dart:io';

import 'package:BookNest/Features/home/domain/entities/book_entity.dart';
import 'package:BookNest/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants.dart';
import '../view_model/related_books_cubit/related_books_cubit.dart';
import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookEntity bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<RelatedBooksCubit>(context)
        .fetchRelatedBooks(category: widget.bookModel.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (widget.bookModel.isAvailable &&
                    widget.bookModel.acsTokenLink != "") {
                  final url = widget.bookModel.acsTokenLink;

                  await downloadPdfToDownloadsFolder(context,
                      widget.bookModel.acsTokenLink, widget.bookModel.title);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Book is not available"),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.download_sharp),
            ),
          ]),
      body: SafeArea(
          child: BookDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}

Future<void> downloadPdfToDownloadsFolder(
    BuildContext context, String url, String fileName) async {
  try {
    final isGranted = await requestStoragePermission(context);

    if (!isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ لم يتم منح صلاحية التخزين')),
      );
      return;
    }

    final Dio dio = Dio();

    final downloadsPath = "/storage/emulated/0/Download";
    final filePath = "$downloadsPath/$fileName.pdf";

    final response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    if (response.statusCode == 200) {
      final file = File(filePath);
      await file.writeAsBytes(response.data);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ تم حفظ الملف في التنزيلات: $fileName.pdf')),
      );
      print('تم حفظ الملف في التنزيلات: $filePath');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('❌ فشل التحميل، كود الحالة: ${response.statusCode}')),
      );
      throw Exception("فشل التحميل، كود الحالة: ${response.statusCode}");
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('⚠️ خطأ أثناء التحميل: $e')),
    );
    print("خطأ أثناء التحميل: $e");
  }
}

Future<bool> requestStoragePermission(BuildContext context) async {
  var status = await Permission.storage.status;

  if (status.isGranted) {
    return true;
  }

  if (status.isDenied) {
    status = await Permission.storage.request();

    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  if (status.isPermanentlyDenied) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ تم رفض الصلاحية نهائيًا، يرجى تفعيلها من الإعدادات'),
        action: SnackBarAction(
          label: 'الإعدادات',
          onPressed: () {
            openAppSettings();
          },
        ),
      ),
    );
    return false;
  }

  return false;
}
