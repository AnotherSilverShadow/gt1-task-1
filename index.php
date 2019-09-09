<?php
/**
 * Устанавливаем соединение
 */
$link = mysqli_connect("localhost", "root", "", "test1_db") or die("Ошибка соединения: " . mysqli_connect_error());

/**
 * Выбираем только необходимые поля из таблицы users
 */
$result_users = mysqli_query($link,
    'SELECT id, fio FROM users') or die("Ошибка запроса к таблице users: " . mysqli_error($link));

/**
 * Получаем по одной строке из таблицы users как ассоциативный массив и перебираем их в цикле
 */
while ($user = mysqli_fetch_assoc($result_users)) {
    /**
     * Выбираем только необходимые поля из таблицы comments
     * Выбираем только те комментарии, которые привязаны к текущему $user
     * Переименовываем user_id в id
     * Так как нам нужен только последний комментарий, то сортируем по дате и выставляем лимит в 1 запись
     */
    $result_comments = mysqli_query($link,
        'SELECT user_id as id, comment, date FROM comments WHERE user_id = ' . $user['id'] . ' ORDER BY date DESC LIMIT 1') or die("Ошибка запроса к таблице comments: " . mysqli_error($link));
    
    /**
     * Получаем строку из таблицы comments как ассоциативный массив
     */
    $last_comment = mysqli_fetch_assoc($result_comments);
    
    /**
     * Если у пользователя еще нет комментариев, то создаем "пустой" массив с последним комментарием
     */
    if (!$last_comment) {
        $last_comment['comment'] = 'No comment yet';
        $last_comment['date'] = '--';
    }
    
    /**
     * Соединяем пользователя и его последний комментарий в один массив
     */
    $users_last_comments[$user['id']] = array_merge($user, $last_comment);
}
/**
 * Закрываем соединение
 */
mysqli_close($link);
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap для приятного вывода результатов -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Task 1</title>
</head>
<body>
<div class="container mt-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">User last comment</h3>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr class="text-center">
                                <th>User ID</th>
                                <th>FIO</th>
                                <th class="w-50">Comment</th>
                                <th>Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            /**
                             * Перебираем общий массив по циклу и выводим данные
                             */
                            foreach ($users_last_comments as $user_comment) {
                                ?>
                                <tr>
                                    <td class="text-center"><?= $user_comment['id']; ?></td>
                                    <td><?= $user_comment['fio']; ?></td>
                                    <td><?= $user_comment['comment']; ?></td>
                                    <td class="text-center"><?= $user_comment['date']; ?></td>
                                </tr>
                                <?php
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>