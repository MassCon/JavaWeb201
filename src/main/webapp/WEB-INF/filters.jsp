
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1>Сервлетні фільтри</h1>
<p>
  Фільтри (сервлетні фільтри) - класи для мережних задач, які утворюють формалізм "Middleware" - активності проміжного рівня.
  Ця активність передує роботі сервлетів і може виконуватись до маршрутизації, тобто для всіх запитів
  (на всі адреси, довільним методом: GET, POST, ...)
<hr/>
Більш того, додаткові фільтри можуть "вбудовуватись" у вже наявний ланцюг викликів
(вставлятись у середину, у "проміжний рівень" )
</p>
<hr/>
<p>
  На прикладі CharsetFilter реалізуємо задачу встановлення кодування для request та response.
  Ця процедура може бути здійснена ДО моменту першого читання/запису, оскільки підтримує мультибайт кодування.
</p>
<hr/>
<ul class="collection">
  <li class="collection-item">
    Створюємо новий пакет filters, у ньому новий клас CharsetFilter
  </li>
  <li class="collection-item">
    Імплементуємо у цьому класі інтерфейс javax.servlet.Filter (!зверніть увагу, бо типів Filter є декілька у різних пакетах)
  </li>
  <li class="collection-item">
    При імплементації не забуваємо, що продовження ланцюга фільтрів має бути реалізовано у ньому, якщо не продовжити - далі
    фільтра запит оброблюватись не буде. Це теж може бути використане, але свідомо.
  </li>
  <li class="collection-item">
    Реєструємо фільтр. Для цього є ті ж можливості, що й для сервлетів, але у випадку фільтрів їх порядок досить часто грає визначальну роль.
    Тому реєстрація за допомогою анотацій - найгірший варіант. Далі див. web.xml
  </li>
  <li class="collection-item">
    Для передачі даних далі по ланці від фільтру використовуємо атрибути
    <code>
      req.setAttribute("charsetName", charsetName);
    </code>
    Вилучити ці дані можна де завгодно (після фільтру), наприклад у JSP:
    charsetName = '<%=request.getAttribute("charsetName")%>'
  </li>
</ul>