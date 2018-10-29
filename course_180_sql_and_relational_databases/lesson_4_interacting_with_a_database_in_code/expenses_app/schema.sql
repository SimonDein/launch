CREATE TABLE expenses(
        id serial       PRIMARY KEY,
    amount decimal(7,2) NOT NULL CONSTRAINT positive_price CHECK (amount > 0.00),
      memo varchar(60)  NOT NULL,
created_on date         NOT NULL DEFAULT CURRENT_DATE 
);

-- Insert some expenses
-- INSERT INTO expenses (amount, memo, created_on) VALUES (14.56, 'Pencils', NOW());
-- INSERT INTO expenses (amount, memo, created_on) VALUES (3.29, 'Coffee', NOW());
-- INSERT INTO expenses (amount, memo, created_on) VALUES (49.99, 'Text Editor', NOW());