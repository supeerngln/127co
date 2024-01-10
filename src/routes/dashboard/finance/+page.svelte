<script lang="ts">
    import { Search, Button } from "flowbite-svelte";
    import Table from "$lib/components/Table.svelte";
    import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  
    import type { PageServerData } from "./$types";
    import {
      salaryHeaders,
      budgetHeaders,
      expenseHeaders,
      ctransactionHeaders
    } from "$lib/headers";
  
    export let data: NonNullable<PageServerData>;
  
    const salary = data["salary"];
    const budget = data["budget"];
    const expense = data["expense"];
    const contract_transaction = data["ctransaction"];
  
    const handleDelete = async (id: number, table: string) => {
      await fetch("/dashboard/supplies/api/database/delete", {
        method: "POST",
        body: JSON.stringify({ id, table }),
      });
    };
  
    const handleEdit = (id: number, table: string) => {};
  </script>
  
  <main class="w-full">
    <Breadcrumb
      items={[{ href: "/dashboard/finance", text: "Finance" }]}
    />

    <Table
      handleEdit={(id) => handleEdit(id, "Salary")}
      handleDelete={(id) => handleDelete(id, "Salary")}
      primaryKey="Salary_Id"
      headers={salaryHeaders}
      rows={salary}
    />
    
    <Table
      handleEdit={(id) => handleEdit(id, "Budget")}
      handleDelete={(id) => handleDelete(id, "Budget")}
      primaryKey="Budget_Id"
      headers={budgetHeaders}
      rows={budget}
    />

    <Table
      primaryKey="Expense_Id"
      headers={expenseHeaders}
      rows={expense}
    />
  

    <Table
      handleEdit={(id) => handleEdit(id, "Contract_Transaction")}
      handleDelete={(id) => handleDelete(id, "Contract_Transaction")}
      primaryKey="CT_Id"
      headers={ctransactionHeaders}
      rows={contract_transaction}
    />
  </main>
  