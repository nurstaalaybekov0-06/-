const Map<String, String> todoTranslations = {
  'Do something nice for someone you care about':
      'Сделать что-нибудь приятное для близкого человека',
  'Memorize a poem': 'Выучить стихотворение',
  'Watch a classic movie': 'Посмотреть классический фильм',
  'Watch a documentary': 'Посмотреть документальный фильм',
  'Invest in cryptocurrency': 'Инвестировать в криптовалюту',
  'Contribute code or a monetary donation to an open-source software project':
      'Помочь open-source проекту кодом или денежным пожертвованием',
  'Plan a trip to another country': 'Спланировать поездку в другую страну',
  'Improve touch typing': 'Улучшить навык слепой печати',
  'Learn Express.js': 'Изучить Express.js',
  'Learn calligraphy': 'Изучить каллиграфию',
  'Have a photo session with some friends': 'Устроить фотосессию с друзьями',
  'Go to the gym': 'Сходить в спортзал',
  "Solve a Rubik's cube": 'Собрать кубик Рубика',
  'Bake pastries for yourself and neighbor':
      'Испечь выпечку для себя и соседа',
  'Go see a Broadway production': 'Сходить на бродвейскую постановку',
  'Write a thank you letter to an influential person in your life':
      'Написать письмо с благодарностью важному человеку в твоей жизни',
  'Invite some friends over for a game night':
      'Пригласить друзей на вечер настольных игр',
};

String translateTodo(String todo) {
  return todoTranslations[todo] ?? todo;
}
