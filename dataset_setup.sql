-- Active: 1771220958691@@localhost@5432@medika_sejahtera
-- Active: 1771220958691@@localhost@5432@medika_sejahtera@public
CREATE DATABASE medika_sejahtera;

CREATE TABLE public.master_customer (
  customer_id varchar PRIMARY KEY,
  customer_name varchar,
  customer_type varchar,
  region varchar,
  alamat varchar,
  payment_terms varchar,
  customer_status varchar
);

CREATE TABLE public.master_sku (
  sku_id VARCHAR PRIMARY KEY,
  sku_name varchar,
  kategori varchar,
  satuan varchar,
  price_min float,
  price_max float,
  sku_status varchar
);

CREATE TABLE public.master_sales_rep (
  sales_rep_id varchar PRIMARY KEY,
  sales_name varchar,
  region varchar,
  status varchar
);

CREATE TABLE public.so_data (
  so_id varchar PRIMARY KEY,
  so_date date,
  customer_id varchar,
  sales_rep_id varchar,
  so_total_value float,
  invoice_count int,
  so_status varchar,

    FOREIGN KEY (customer_id) REFERENCES public.master_customer (customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES public.master_sales_rep (sales_rep_id)
);

CREATE TABLE public.so_detail (
  so_id varchar,
  no_urut int,
  sku_id varchar,
  nama_produk varchar,
  qty_order int,
  unit_price float,
  subtotal float,

    FOREIGN KEY (so_id) REFERENCES public.so_data (so_id),
    FOREIGN KEY (sku_id) REFERENCES public.master_sku (sku_id)
);

CREATE TABLE public.invoice_data (
    invoice_id VARCHAR,
    so_id varchar,
    customer_id varchar,
    invoice_date date,
    is_partial boolean,
    partial_ke FLOAT,
    invoice_value float,
    payment_status varchar,
    status_invoice varchar,
    bundle_complete_date date,
    has_return boolean,

    FOREIGN KEY (so_id) REFERENCES public.so_data (so_id),
    FOREIGN KEY (customer_id) REFERENCES public.master_customer (customer_id)
);

CREATE TABLE public.invoice_detail (
    invoice_id VARCHAR,
    so_id varchar,
    no_urut int,
    nama_produk varchar,
    qty_delivered int,
    unit_price float,
    total float,    
    FOREIGN KEY (so_id) REFERENCES public.so_data (so_id)
);

CREATE TABLE public.dn_data (
    dn_id VARCHAR PRIMARY KEY,
    invoice_id VARCHAR,
    customer_id varchar,
    delivery_date date,
    delivery_method varchar,
    dn_return_date date,
    status_dn varchar,    


    FOREIGN KEY (customer_id) REFERENCES public.master_customer (customer_id)
);

CREATE TABLE public.return_data (
    retur_id VARCHAR PRIMARY KEY,
    invoice_id VARCHAR,
    so_id varchar,
    sku_id varchar,
    nama_produk varchar,
    qty_returned int,
    return_reason varchar,
    return_date date,
    status_return varchar,
    value_return float,    

    
    FOREIGN KEY (so_id) REFERENCES public.so_data (so_id),
    FOREIGN KEY (sku_id) REFERENCES public.master_sku (sku_id)
);

/*
\copy dn_data FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\dn_data.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy invoice_data FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\invoice_data.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy invoice_detail FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\invoice_detail.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy master_customer FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\master_customer.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy master_sales_rep FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\master_sales_rep.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy master_sku FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\master_sku.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy return_data FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\retur_data.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy so_data FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\so_data.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy so_detail FROM 'C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset\so_detail.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

C:\Users\FITRAH\OneDrive - Virtual Education Academy\Portfolio\MedikaUtama\Dataset
*/

DROP Table IF EXISTS public.master_customer;
DROP Table IF EXISTS public.master_sku;
DROP Table IF EXISTS public.master_sales_rep;
DROP Table IF EXISTS public.so_data;
DROP Table IF EXISTS public.so_detail;
DROP Table IF EXISTS public.invoice_data;
DROP Table IF EXISTS public.invoice_detail;
DROP Table IF EXISTS public.dn_data;
DROP Table IF EXISTS public.return_data;