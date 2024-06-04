import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/endPoints.dart';
import 'package:hack_talk/features/home/presentation/model/cv_result_model.dart';
import 'package:meta/meta.dart';

part 'cv_result_state.dart';

class CvResultCubit extends Cubit<CvResultState> {
  CvResultCubit() : super(CvResultInitial());
  List<CVResultModel> cVResultModel = [];
  Future showCVResult(File file) async {
    emit(CvResultLoadingState());
    await DioHelper.postAi(
      url: Endpoints.video,
      data: FormData.fromMap(
        {
          "file": await MultipartFile.fromFile(file.path),
        },
      ),
    ).then((value) {
      cVResultModel = (value.data["results"] as List<dynamic>)
          .map((e) => CVResultModel.fromJson(e))
          .toList();
    });
    emit(CvResultShowResultState());
  }
}