import 'package:hive/hive.dart';
import 'package:myappbootcamp/model/configuracao_model.dart';

class ConfiguracoesRepository {
  static late Box _box;

  void carregar() async {
    if (Hive.isBoxOpen('configuracoes')) {
      _box = Hive.box('configuracoes');
    } else {
      _box = await Hive.openBox('configuracoes');
    }
  }

  void salvar(ConfiguracoesModel configuracoesModel) {
    _box.put('configuracoesModel', {
      'nomeUsuario': configuracoesModel.nomeUsuario,
      'altura': configuracoesModel.altura,
      'receberNotificacoes': configuracoesModel.receberNotificacoes,
      'temaEscuro': configuracoesModel.temaEscuro
    });
  }

  ConfiguracoesModel obterDados() {
    var configuracoes = _box.get('configuracoesModel');
    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    }
    return ConfiguracoesModel(
        configuracoes["nomeUsuario"],
        configuracoes["altura"],
        configuracoes["receberNotificacoes"],
        configuracoes["temaEscuro"]);
  }
}
