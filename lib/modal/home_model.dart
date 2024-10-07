import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagemModel {
  XFile? _imagem;

  XFile? get imagem => _imagem;

 
  void setImagem(XFile imagemSelecionada) {
    _imagem = imagemSelecionada;
  }


  Future<String> salvarImagem() async {
    if (_imagem == null) {
      throw Exception("Nenhuma imagem foi selecionada");
    }

  
    final diretorio = await getApplicationDocumentsDirectory();
    final String nomeArquivo = 'imagem_${DateTime.now().millisecondsSinceEpoch}.png';

    
    final File novaImagem = File('${diretorio.path}/$nomeArquivo');
    await novaImagem.copy(_imagem!.path);

    return novaImagem.path;
  }
}
