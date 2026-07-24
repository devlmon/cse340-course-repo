// Import needed model functions
import { getAllProjects, getProjectsByOrganizationId, getUpcomingProjects, getProjectDetails  } from '../models/projects.js';

const NUMBER_OF_UPCOMING_PROJECTS = 5;

// Define controller functions
const showProjectsPage = async (req, res) => {
    const projects = await getUpcomingProjects(NUMBER_OF_UPCOMING_PROJECTS); // Get the upcoming projects
    const title = 'Upcoming Service Projects';

    res.render('projects', { title, projects });
};  

const showProjectDetailsPage = async (req, res) => {
    const projectId = req.params.id;
    const projectDetails = await getProjectDetails(projectId); // Get the project details
    const title = projectDetails.title;

    res.render('project', { title, projectDetails });
};

// Export controller functions
export { showProjectsPage, showProjectDetailsPage };