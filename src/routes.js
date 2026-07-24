import express from 'express';

import { showHomePage } from './controllers/index.js';
import { showOrganizationsPage } from './controllers/organizations.js';
import { showProjectsPage } from './controllers/projects.js';
import { showProjectDetailsPage } from './controllers/projects.js';
import { showCategoriesPage } from './controllers/categories.js';
import { showOrganizationDetailsPage } from './controllers/organizations.js';
import { testErrorPage } from './controllers/errors.js';

const router = express.Router();

// Route for the home page
router.get('/', showHomePage);
// Route for the organizations page
router.get('/organizations', showOrganizationsPage);
// Route for the projects page
router.get('/projects', showProjectsPage);
// Route for the project details page
router.get('/project/:id', showProjectDetailsPage);
// Route for the categories page
router.get('/categories', showCategoriesPage);
// Route for organization details page
router.get('/organization/:id', showOrganizationDetailsPage);

// error-handling routes
router.get('/test-error', testErrorPage);

export default router;