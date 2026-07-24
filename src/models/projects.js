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
        SELECT
          project_id,
          organization_id,
          title,
          description,
          location,
          date
        FROM project
        WHERE organization_id = $1
        ORDER BY date;
      `;
      
      const queryParams = [organizationId];
      const result = await db.query(query, queryParams);

      return result.rows;
};

// Export the model functions
export { getAllProjects, getProjectsByOrganizationId };