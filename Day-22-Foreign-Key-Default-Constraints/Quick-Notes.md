<div align="center">

# 🗄️ Day 22 — SQL Server Foreign Key, DEFAULT & Relationships

### Foreign Key • DEFAULT • Relationships • Composite Key • ALTER TABLE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 1. FOREIGN KEY

- `FOREIGN KEY` is used to establish a relationship between two tables.
- It references the `PRIMARY KEY` or `UNIQUE` key of another table.
- The referenced table is called the **Parent Table**.
- The table containing the foreign key is called the **Child Table**.

### Syntax

```sql
FOREIGN KEY (column_name)
REFERENCES parent_table(parent_column);
