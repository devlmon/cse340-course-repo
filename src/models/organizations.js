import db from './db.js'

const getAllOrganizations = async () => {
    const query = `
        SELECT organization_id, name, description, contact_email, logo_filename
        FROM public.organization;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getOrganizationCount = async () => {
    const query = `
        SELECT COUNT(*) as count
        FROM public.organization;
    `;

    const result = await db.query(query);

    return result.rows[0].count;
}

export { getAllOrganizations, getOrganizationCount }  