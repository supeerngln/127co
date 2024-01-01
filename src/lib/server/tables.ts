export interface Supplier {
  id: number;
  name: string;
  address: string;
  contactNumber: string;
  email: string;
}

export interface Item {
  id: number;
  employeeId: number;
  type: string;
  status: string;
  lastUpdated: string;
  supplierId: number;
  location: string;
}

export interface Transaction {
  id: number;
  propertyId: number;
  type: string;
  datetime: string;
}
