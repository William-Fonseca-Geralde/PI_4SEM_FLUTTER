import 'dart:math';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openpix.com.br/api/v1/qrcode-static',
      headers: {
        'Authorization': 'Q2xpZW50X0lkX2RiNTE2YmQ1LTljNzMtNGQzOS05YzVkLTk4NjE1MmIzZjMwYjpDbGllbnRfU2VjcmV0X1ltWHVWMW8ydmpVdGRpQlZkMFBxbHFFamtsS2E2L0VjWEpRQkQ4aVFtbUk9',
      }
    )
  );

  String _geradorId() {
    const character = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random.secure();
    String id = '';

    for (var i = 0; i < 20; i++) {
      id += character[random.nextInt(character.length)];
    }

    return id;
  }

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Erro ao fazer a requisição');
    }
  }

  Future<dynamic> criarPagamento(String nome, double valor) async {
    String _identifier = _geradorId();

    final Map<String, dynamic> data = {
      'name': nome,
      'identifier': _identifier,
      'value': valor
    };

    try {
      final response = await _dio.post('', data: data);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Erro ao enviar os dados');
    }
  }
}