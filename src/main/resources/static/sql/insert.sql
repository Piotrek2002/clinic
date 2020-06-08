INSERT INTO clinic.user (id, enabled, insurance, name, password, pesel, salary, surname, username) VALUES (1, 1, 1, null, '$2a$10$mTSMCcYGM0U1fFTmmcdh.exWKKdmdgGs9FZKT6VzzxZo7WWZ7pKTO', 11111111111, 4000, null, 'user');
INSERT INTO clinic.user (id, enabled, insurance, name, password, pesel, salary, surname, username) VALUES (2, 1, 1, null, '$2a$10$Cjs/kLdyMCuT4JdJo0OibuBJqCkfQCRpZ7vILBRKPRMuv8ywPXbeW', 22222222222, 0, null, 'admin');
INSERT INTO clinic.user (id, enabled, insurance, name, password, pesel, salary, surname, username) VALUES (3, 1, 0, null, '$2a$10$M1Ml071kiuO7pRksEMbEs.xzT27IZnKrtQkRZWOCnvAgKdqqAeVoC', 33333333333, 0, null, 'patient');

INSERT INTO clinic.role (id, name) VALUES (1, 'ROLE_ADMIN');
INSERT INTO clinic.role (id, name) VALUES (2, 'ROLE_USER');
INSERT INTO clinic.role (id, name) VALUES (3, 'ROLE_PATIENT');

INSERT INTO clinic.user_role (user_id, role_id) VALUES (2, 1);
INSERT INTO clinic.user_role (user_id, role_id) VALUES (1, 2);
INSERT INTO clinic.user_role (user_id, role_id) VALUES (3, 3);