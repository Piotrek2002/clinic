#Użytkownicy
INSERT INTO clinic.user (id, enabled, insurance, name, password, pesel, salary, surname, username) VALUES (1, 1, 1, 'Piotr', '$2a$10$vg0p9najdPldbRx0sOGT5O57F.2xs1ojxtNuuu3iUklwi1wMPUWeS', 11111111111, 0, 'Krzyszowski', 'Piotr');
INSERT INTO clinic.user (id, enabled, insurance, name, password, pesel, salary, surname, username) VALUES (2, 0, 1, 'Jacek', '$2a$10$ODkntb3POAY3hGZpn1Z/KurZue9cHhNq6qiGcI9j.2VIg9auxZ8sm', 222222222, 0, 'Kowalski', 'Jacek');
INSERT INTO clinic.user (id, enabled, insurance, name, password, pesel, salary, surname, username) VALUES (3, 0, 1, 'Dominik', '$2a$10$i3Asa8P6MfF9qZmMQtjiHOlZ63xl/PSeYewX/lKyPVUxjRviBDKni', 333333333, 0, 'Molenda', 'Dominik');
INSERT INTO clinic.user (id, enabled, insurance, name, password, pesel, salary, surname, username) VALUES (4, 0, 1, 'Admin', '$2a$10$H/6Cn/HUes/zgqpU8Vg5yuKrgRlNnpJFc/tT3nLPn4pLtfiLXn/Xa', 444444444, 0, 'Admin', 'Admin');
#Role
INSERT INTO clinic.role (id, name) VALUES (1, 'ROLE_ADMIN');
INSERT INTO clinic.role (id, name) VALUES (2, 'ROLE_USER');
INSERT INTO clinic.role (id, name) VALUES (3, 'ROLE_PATIENT');

#Role dla użytkowników
INSERT INTO clinic.user_role (user_id, role_id) VALUES (2, 3);
INSERT INTO clinic.user_role (user_id, role_id) VALUES (1, 3);
INSERT INTO clinic.user_role (user_id, role_id) VALUES (3, 2);
INSERT INTO clinic.user_role (user_id, role_id) VALUES (4, 1);

#Zabiegi
INSERT INTO clinic.treatment (id, description, name, price, enable) VALUES (1, 'Elektrokardiografia - to badanie wykorzystywane w celu diagnostyki chorób serca. Dla Pacjenta jest ono bezbolesne i nieinwazyjne, Lekarzowi dostarcza cennych informacji na temat funkcjonowania mięśnia sercowego.', 'EKG', 100, 1);
INSERT INTO clinic.treatment (id, description, name, price, enable) VALUES (2, 'Szczepienia stosuje się, aby wytworzyć w organizmie ochronę przed ciężkim przebiegiem choroby i jej następstwami. Wywołuje ona naturalną odporność organizmu, podobną do tej, jaką osiąga się po przebytej chorobie.
', 'Szczepienia ochronne
', 70, 1);
INSERT INTO clinic.treatment (id, description, name, price, enable) VALUES (3, 'Pomiar ciśnienia tętniczego umożliwia określenie, z jaką siłą krew pompowana przez serce uderza o ściany naczyń tętniczych naszego organizmu. Wartość ciśnienia zależy więc od ilości krwi oraz siły, z jaką jest wyrzucana z serca, a także od elastyczności ścian tętnic.', 'Pomiar ciśnienia
', 20, 1);
INSERT INTO clinic.treatment (id, description, name, price, enable) VALUES (4, 'To czynność polegająca na usunięciu szwów z powstających ran, np. pooperacyjnych lub pourazowych. Zdjęcie szwów odbywa się w określonym terminie. Czas ten jest uzależniony od czasu gojenia się rany.
', 'Zdjęcie szwów', 70, 1);
INSERT INTO clinic.treatment (id, description, name, price, enable) VALUES (5, 'Opatrunek to struktura ochraniająca ranę lub skaleczenie przed środowiskiem zewnętrznym, zabezpieczająca dalszemu zakażeniu. Opatrunek może nie tylko osłaniać ranę, ale także może zawierać substancje lecznicze, które działają przeciwbakteryjnie lub przyspieszający gojenie.', 'Opatrunki', 50, 1);
INSERT INTO clinic.treatment (id, description, name, price, enable) VALUES (6, 'Pobranie krwi to czynność polegająca na pobraniu materiału zakaźnego, najczęściej z żyły łokciowej, celem dalszej diagnostyki w laboratorium diagnostycznym. Każde badanie ma swoją normę referencyjną, materiał pobrany od Pacjenta może mieścić się w przedziale normy, bądź też jego wartości mogą przybrać formę deficytu lub nadprodukcji.', 'Pobieranie krwi', 50, 1);
INSERT INTO clinic.treatment (id, description, name, price, enable) VALUES (7, 'To zabieg leczniczy polegający na podawaniu roztworu leków lub ich aerozoli do dróg oddechowych, wraz z wdychanym powietrzem. Wykorzystuje się w tym celu gorące płyny, inhalatory lub nebulizatory. Jest to jedna z najprostszych metod leczenia. To niezwykle skuteczny sposób na zatkany nos. Ułatwia funkcjonowanie w czasie, w którym jest ono utrudnione przez infekcję.
', 'Inhalacje', 45, 1);

#Wizyty
INSERT INTO clinic.visit (id, date, description, price, status, user_id, patient_profile_id, treatment_id) VALUES (1, '2018-06-12 10:30:00', 'Kilka minut przed planowanym EKG, najlepiej usiąść i starać się zrelaksować. W dzień badania nie można pić kawy, alkoholu i palić papierosów, ponieważ przyspieszają rytm serca. Nie są również polecane zimne napoje spożywane bezpośrednio przed badaniem.', 100, 1, 3, 1, 1);
INSERT INTO clinic.visit (id, date, description, price, status, user_id, patient_profile_id, treatment_id) VALUES (2, '2020-06-17 09:30:00', 'Przed każdym szczepieniem, Pacjent musi być zbadany przez odpowiedniego lekarza. Dokonuje się również kwalifikacji Pacjenta. To procedura medyczna, polegająca na określeniu wskazań i przeciwskazań.', 70, 1, 3, 1, 2);
INSERT INTO clinic.visit (id, date, description, price, status, user_id, patient_profile_id, treatment_id) VALUES (3, '2021-01-17 13:45:00', 'Nie należy mierzyć ciśnienia krwi bezpośrednio po dużym posiłku. Nie można pić kawy i palić papierosów co najmniej 30 minut przed pomiarem. Wskazany jest kilkuminutowy odpoczynek w pozycji siedzącej. Ciśnienie krwi należy mierzyć w normalnej temperaturze ciała. Jeśli organizm jest wyziębiony lub rozgrzany, warto chwilę odczekać. Pomiar powinien być dokonany w lewej ręce. Kończyna górna powinna być obnażona, bez uciskającej odzieży, biżuterii i zegarka.', 20, 0, 3, 1, 3);
INSERT INTO clinic.visit (id, date, description, price, status, user_id, patient_profile_id, treatment_id) VALUES (4, '2020-07-12 08:00:00', 'Przed zdjęciem szwów należy pamiętać, aby ubrania nie uciskały miejsca rany, by miejsce było łatwo dostępne. Od założenia szwów do zdjęcia, ograniczyć wysiłek fizyczny wskazanej kończyny. Zachować ostrożność podczas toalety, aby nie zamoczyć rany.', 70, 0, 1, 2, 4);
INSERT INTO clinic.visit (id, date, description, price, status, user_id, patient_profile_id, treatment_id) VALUES (5, '2020-06-24 13:00:00', 'Dostosować ubranie tak, aby miejsce opatrunku było łatwodostepne. Nie nadwyrężać miejsca, w którym jest naruszenie ciągłości tkanki. Starać zachować higienę wokół rany.', 0, 0, 3, 2, 5);
INSERT INTO clinic.visit (id, date, description, price, status, user_id, patient_profile_id, treatment_id) VALUES (6, '2020-07-01 11:45:00', 'Pacjent na 10 godzin przed musi być na czczo. Pić dużo wody niegazowanej, aby żyły były nawodnione. Nie przyjmować żadnych leków przed pobraniem krwi. Ograniczyć wysiłek fizyczny. Pokarmy dzień przed muszą być lekkostrawne.', 0, 0, 3, 2, 6);
INSERT INTO clinic.visit (id, date, description, price, status, user_id, patient_profile_id, treatment_id) VALUES (7, '2020-06-22 07:00:00', 'Usiąść w bliskiej odległości od inhalatora, odprężyć się, oddech wyrównać, uspokoić. Przed inhalacją zabronione jest palenie papierosów, aby drzewo oskrzelowe było odpowiednio przygotowane.', 0, 0, 3, 2, 7);