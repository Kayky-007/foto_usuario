import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeController {
  XFile? _imagem;
  XFile? imagemSelecionada;

  XFile? get imagem => _imagem;

  Future<void> obterImagem() async {
    final imagem = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagem == null) return;

    _imagem = imagem;
  }

  Future<String> salvarImagem() async {
    if (_imagem == null) {
      print("Nenhuma imagem foi selecionada");
    } else {
      imagemSelecionada = _imagem;
    }

    final diretorio = await getApplicationDocumentsDirectory();

    final String nomeArquivo = 'imagem_${DateTime.now().millisecondsSinceEpoch}.png';
    final File novaImagem = File('${diretorio.path}/$nomeArquivo');

    
    await novaImagem.copy(imagemSelecionada!.path);
  print(novaImagem.path);
    return novaImagem.path;
  }

  

  Future<void> verificadorImagem() async {
    try {
      String salvarPath = await salvarImagem();
      if (salvarPath.isNotEmpty) {
        print("Imagem salva em: $salvarPath");
      } else {
        print("Erro ao salvar imagem");
      }
    } catch (e) {
      print("Erro: $e");
    }
  }
}
