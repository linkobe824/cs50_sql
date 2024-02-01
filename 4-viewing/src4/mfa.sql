ALTER TABLE collections ADD COLUMN deleted INTEGER DEFAULT 0;

UPDATE collections SET deleted = 1
WHERE title = 'Farmers working at dawn';

SELECT * FROM collections WHERE deleted = 0;

CREATE VIEW current_collections AS
SELECT id, title, accession_number, acquired FROM collections
WHERE deleted = 0;

CREATE TRIGGER 'delete'
INSTEAD OF DELETE ON 'current_collections'
FOR EACH ROW
BEGIN
    UPDATE collections SET deleted = 1
    WHERE id = OLD.id;
END;

DELETE FROM current_collections
WHERE title = 'Imaginative landscape';

CREATE TRIGGER 'insert_when_exists'
INSTEAD OF INSERT ON 'current_collections'
FOR EACH ROW
WHEN NEW.accession_number IN (
    SELECT accession_number FROM collections
)
BEGIN
    UPDATE collections SET deleted = 0
    WHERE accession_number = NEW.accession_number;
END;

INSERT INTO current_collections (title, accession_number, acquired)
VALUES ('Imaginative landscape', '56.496', NULL);

