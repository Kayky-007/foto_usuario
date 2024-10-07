import 'package:foto_usuario/modal/home_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeController {
  final ImagemModel _imagemModel = ImagemModel();

  XFile? get imagem => _imagemModel.imagem;

  
  Future<void> obterImagem() async {
    final imagem = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagem == null) return;

    _imagemModel.setImagem(imagem); 
  }

  
  Future<void> verificadorImagem() async {
    try {
      String salvarPath = await _imagemModel.salvarImagem();
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
