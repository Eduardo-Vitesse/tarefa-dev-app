String dateFormatter(String data) {
  List<String> partesData = data.split('/');
  String mesExtenso;

  int dia = int.parse(partesData[0]);
  int mes = int.parse(partesData[1]);
  int ano = int.parse(partesData[2]);

  switch (mes) {
    case 01:
      mesExtenso = 'Janeiro';
      break;
    case 02:
      mesExtenso = 'Fevereiro';
      break;
    case 03:
      mesExtenso = 'Março';
      break;
    case 04:
      mesExtenso = 'Abril';
      break;
    case 05:
      mesExtenso = 'Maio';
      break;
    case 06:
      mesExtenso = 'Junho';
      break;
    case 07:
      mesExtenso = 'Julho';
      break;
    case 08:
      mesExtenso = 'Agosto';
      break;
    case 09:
      mesExtenso = 'Setembro';
      break;
    case 10:
      mesExtenso = 'Outubro';
      break;
    case 11:
      mesExtenso = 'Novembro';
      break;
    case 12:
      mesExtenso = 'Dezembro';
      break;

    default:
      mesExtenso = 'Mês inválido';
      break;
  }

  return '${dia <= 9 ? '0$dia' : '$dia'} de $mesExtenso de $ano';
}
