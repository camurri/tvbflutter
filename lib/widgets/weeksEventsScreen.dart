import 'package:flutter/material.dart';
import 'package:app_tvb/texts/weekTexts.dart';

class WeekEventsScreen extends StatelessWidget {
  String getWeekReminder() {
    DateTime now = DateTime.now();

    // Se for dezembro, exibe a mensagem fixa de "Boas Festas"
    if (now.month == 12) {
      return "Desejamos a todos🎄 Boas Festas !🎁";
    }

    // Obtém o primeiro dia do mês
    int firstDayOfMonth = DateTime(now.year, now.month, 1).weekday;

    // Calcula a semana com base no dia atual e no primeiro dia do mês
    int weekOfMonth = ((now.day + firstDayOfMonth - 2) ~/ 7) + 1;

    // Garante que a semana não seja maior que 5
    if (weekOfMonth > 5) weekOfMonth = 5;

    // Define um lembrete para cada semana (exceto dezembro)
    switch (weekOfMonth) {
      case 1:
        return week_txts['week_txt_1'] ?? "Pretos Velhos e Erês";
      case 2:
        return week_txts['week_txt_2'] ?? "Cabolhos e Boiadeiros";
      case 3:
        return week_txts['week_txt_3'] ?? "Baianos e Marinheiros";
      case 4:
        return week_txts['week_txt_4'] ?? "Semana de Esquerda";
      case 5:
        return week_txts['week_txt_5']  ?? "Nova agenda em breve";
      default:
        return week_txts['week_txt_default'] ?? "Bem-vindo";
    }
  }

  @override
  Widget build(BuildContext context) {
    return
          Text(
            getWeekReminder(),
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
    );
  }
}
