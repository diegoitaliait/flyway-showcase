CREATE OR REPLACE VIEW v_customer_invoce_track AS select c.CustomerId, i.InvoiceId, il.TrackId
            from Customer c join Invoice i on (c.CustomerId = i.CustomerId)
            join InvoiceLine il on (i.InvoiceId = il.InvoiceId);