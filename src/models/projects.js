import db from './db.js'

const getAllProjects = async () => {
    const query = `
        SELECT sp.organization_id, sp.title, sp.description, sp.location, sp.project_date, o.name
        FROM public.service_project sp
        INNER JOIN public.organization o
        ON sp.organization_id = o.organization_id
        ORDER BY sp.project_date ASC;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getProjectsByOrganizationId = async (organizationId) => {
      const query = `
        SELECT service_project_id, organization_id, title, description, location, project_date
        FROM public.service_project
        WHERE organization_id = $1
        ORDER BY project_date;
      `;
      
      const queryParams = [organizationId];
      const result = await db.query(query, queryParams);

      return result.rows;
};

const getUpcomingProjects = async (numberOfProjects) => {
    const query = `
        SELECT sp.service_project_id, sp.organization_id, sp.title, sp.description, sp.location, sp.project_date, o.name
        FROM public.service_project sp
        INNER JOIN public.organization o
        ON sp.organization_id = o.organization_id
        WHERE sp.project_date > CURRENT_DATE
        ORDER BY sp.project_date ASC
        LIMIT $1;
    `;

    const queryParams = [numberOfProjects];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjectDetails = async (id) => {
    const query = `
        SELECT sp.service_project_id, sp.organization_id, sp.title, sp.description, sp.location, sp.project_date, o.name
        FROM public.service_project sp
        INNER JOIN public.organization o
        ON sp.organization_id = o.organization_id
        WHERE sp.service_project_id = $1
    `;

    const queryParams = [id];
    const result = await db.query(query, queryParams);

    return result.rows[0]; // Return the first (and only) row
};

// Export the model functions
export { getAllProjects, getProjectsByOrganizationId, getUpcomingProjects, getProjectDetails };