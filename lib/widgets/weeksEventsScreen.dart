import 'package:flutter/cupertino.dart';
import '../texts/weekTexts.dart';
import 'iconLoader.dart';

class WeekEventsScreen extends StatelessWidget {
  Map<String, String> getWeekReminder() {
    DateTime now = DateTime.now();
    String message;
    String imagePath;

    // Verifica se é dezembro
    if (now.month == 12) {
      message = "Desejamos a todos🎄 Boas Festas !🎁";
      imagePath = 'assets/images/svg/logo.svg'; // Use a imagem padrão para dezembro
      return {'message': message, 'imagePath': imagePath};
    }

    // Verifica se é domingo e se o horário está entre 18:00 e 23:59
    if (now.weekday == DateTime.sunday && now.hour >= 18 && now.hour <= 23) {
      message = week_txts['week_txt_5'] ?? "Nova agenda em breve";
      imagePath = week_txts['path_icon_5'] ?? 'assets/images/svg/logo.svg';
      return {'message': message, 'imagePath': imagePath};
    }

    // Obtém o primeiro dia do mês
    int firstDayOfMonth = DateTime(now.year, now.month, 1).weekday;

    // Calcula a semana com base no dia atual e no primeiro dia do mês
    int weekOfMonth = ((now.day + firstDayOfMonth - 2) ~/ 7) + 1;

    // Garante que a semana não seja maior que 5
    if (weekOfMonth > 5) weekOfMonth = 5;

    // Modificação: Adicionando um controle especial para o dia 25 de fevereiro de 2025
    if (now.year == 2025 && now.month == 2 && now.day == 25) {
      message = week_txts['week_txt_1'] ?? "Pretos Velhos e Erês";
      imagePath = week_txts['path_icon_1'] ?? 'assets/images/svg/chupeta.svg';
      return {'message': message, 'imagePath': imagePath};
    }

    // Define um lembrete para cada semana (exceto dezembro)
    switch (weekOfMonth) {
      case 1:
        message = week_txts['week_txt_1'] ?? "Pretos Velhos e Erês";
        imagePath = week_txts['path_icon_1'] ?? 'assets/images/svg/chupeta.svg';
        break;
      case 2:
        message = week_txts['week_txt_2'] ?? "Caboclos e Boiadeiros";
        imagePath = week_txts['path_icon_2'] ?? 'assets/images/svg/flecha.svg';
        break;
      case 3:
        message = week_txts['week_txt_3'] ?? "Baianos e Marinheiros";
        imagePath = week_txts['path_icon_3'] ?? 'assets/images/svg/coco.svg';
        break;
      case 4:
        message = week_txts['week_txt_4'] ?? "Semana de Esquerda";
        imagePath = week_txts['path_icon_4'] ?? 'assets/images/svg/tridente.svg';
        break;
      case 5:
        message = week_txts['week_txt_5'] ?? "Nova agenda em breve";
        imagePath = week_txts['path_icon_5'] ?? 'assets/images/svg/logo.svg';
        break;
      default:
        message = week_txts['week_txt_default'] ?? "Bem-vindo";
        imagePath = week_txts['path_icon_6'] ?? 'assets/images/svg/logo.svg';
        break;
    }

    return {'message': message, 'imagePath': imagePath};
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> reminder = getWeekReminder();

    return Column(
      children: [
        Text(
          reminder['message']!,
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        IconLoader(path: reminder['imagePath']!),
        Text('TVB', style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
