import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_colors.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/constants/app_typography.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/api_service.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/dio_client.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/services/token_storage.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_button.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/widgets/custom_text_field.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/home_screen.dart';
import 'package:flutter_masibelajar/tugas/tugas_16/views/register_screen.dart';

class LoginScreenTugas16 extends StatefulWidget {
  const LoginScreenTugas16({super.key});

  @override
  State<LoginScreenTugas16> createState() => _LoginScreenTugas16State();
}

class _LoginScreenTugas16State extends State<LoginScreenTugas16> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _emailFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    try {
      final dio = createDioClient();
      final apiService = ApiService(dio);

      final response = await apiService.login({
        'email': email,
        'password': password,
      });

      if (!mounted) return;
      setState(() => _isLoading = false);

      final token = response.data?.token;
      if (token != null && token.isNotEmpty) {
        await TokenStorage.saveToken(token);
      }

      if (!mounted) return;

      final userName = response.data?.user?.name ?? 'Pengguna';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selamat datang kembali, $userName!'),
          backgroundColor: AppColors.emerald,
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomeScreenTugas16()),
        (route) => false,
      );
    } on DioException catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      String message = 'Terjadi kesalahan saat masuk. Silakan coba lagi.';
      if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
        final data = e.response!.data as Map<String, dynamic>;
        if (data.containsKey('message')) {
          message = data['message'].toString();
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        message = 'Koneksi bermasalah. Periksa jaringan internet Anda.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Kesalahan tak terduga: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasDefault,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.inkDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Masuk Akun Absensi',
                  style: AppTypography.displayLarge.copyWith(
                    color: AppColors.primaryNavy,
                    fontSize: 32,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Masukkan email dan kata sandi Anda untuk mengakses portal absensi PPKD.',
                  style: AppTypography.bodyRegular.copyWith(
                    color: AppColors.mutedGray,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  label: 'Email',
                  hintText: 'nama@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => _passwordFocusNode.requestFocus(),
                  supportingText: 'Gunakan email terdaftar',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.mutedGray,
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }
                    if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val.trim())) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  label: 'Kata Sandi',
                  hintText: '••••••••',
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _handleLogin(),
                  supportingText: 'Minimal 8 karakter kombinasi huruf & angka',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.mutedGray,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColors.mutedGray,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Kata sandi wajib diisi';
                    }
                    if (val.length < 6) {
                      return 'Kata sandi minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Masuk ke Absensi',
                  height: 54,
                  backgroundColor: AppColors.primaryNavy,
                  borderRadius: BorderRadius.circular(30),
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Belum terdaftar sebagai peserta? ',
                        style: AppTypography.footnoteRegular.copyWith(
                          color: AppColors.inkSoft,
                        ),
                        children: [
                          TextSpan(
                            text: 'Daftar Sekarang',
                            style: AppTypography.footnoteBold.copyWith(
                              color: AppColors.primaryBlue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterScreenTugas16(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
