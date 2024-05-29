import 'package:flutter/material.dart';

class VerifyConResModel {
  String? message;
  String? redirectUrl;
  String? rOtp;

  VerifyConResModel({this.message, this.redirectUrl});

  VerifyConResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    redirectUrl = json['redirect_url'];
    rOtp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['redirect_url'] = this.redirectUrl;
    data['otp'] = this.rOtp;
    return data;
  }
}
