-- Organization Table ---------------
-- ----------------------------------

CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
  (
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
  ),
  (
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
  ),
  (
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
  );

SELECT * FROM organization;

-- Service Project Table -----------
-- ----------------------------------

CREATE TABLE service_project (
    service_project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
);

INSERT INTO service_project (organization_id, title, description, location, project_date)
VALUES
  (
    1,
    'Community Playground Renovation',
    'Revitalization of the downtown community playground including new equipment installation, safety surfacing, and landscaping improvements.',
    '123 Main Street, Downtown Park',
    '2026-09-15'
  ),
  (
    1,
    'School Roof Repair and Reinforcement',
    'Structural assessment and repair of the elementary school roof with new waterproofing and insulation materials.',
    '200 School Drive, Elementary School',
    '2026-10-01'
  ),
  (
    1,
    'Bridge Restoration Project',
    'Complete restoration of the historic pedestrian bridge including deck replacement, railing updates, and safety inspections.',
    '555 River Road, Old Bridge',
    '2026-11-15'
  ),
  (
    1,
    'Community Center Accessibility Upgrade',
    'Installation of wheelchair ramps, accessible bathrooms, and elevator systems to improve facility accessibility.',
    '300 Community Boulevard, Community Center',
    '2026-08-10'
  ),
    (
    1,
    'Library Renovation and Technology Integration',
    'Modernization of the public library including new digital infrastructure, accessible stations, and community meeting spaces.',
    '150 Knowledge Drive, Public Library',
    '2026-09-20'
  ),
  (
    2,
    'Urban Garden Initiative',
    'Establishment of raised garden beds and vertical farming structures in the community center courtyard to promote local food production.',
    '456 Oak Avenue, Community Center',
    '2026-08-20'
  ),
  (
    2,
    'School Garden and Nutrition Education',
    'Creation of educational vegetable gardens at three local schools with curriculum integration and student workshops.',
    '301 Pine Street, Multiple Schools',
    '2026-07-25'
  ),
  (
    2,
    'Rooftop Farming Initiative',
    'Development of productive rooftop gardens on commercial buildings to maximize urban farming space and yield.',
    '789 Commerce Street, Downtown District',
    '2026-09-05'
  ),
  (
    2,
    'Community Seed Bank and Composting Center',
    'Establishment of a community seed library and organic composting facility for neighborhood residents.',
    '412 Green Lane, Neighborhood Hub',
    '2026-08-30'
  ),
  (
    2,
    'Neighborhood Composting Education Program',
    'Community workshops and supply distribution for home composting initiatives across residential neighborhoods.',
    '250 Sustainability Lane, Environmental Center',
    '2026-08-05'
  ),
  (
    3,
    'Seniors Support Program',
    'Comprehensive assistance program providing home visits, meal preparation, and companionship services for elderly community members.',
    '789 Elm Street, Senior Center',
    '2026-07-30'
  ),
  (
    3,
    'Youth Mentorship Initiative',
    'Structured mentoring program pairing experienced volunteers with at-risk youth for academic support and life guidance.',
    '555 Youth Avenue, Youth Center',
    '2026-09-01'
  ),
  (
    3,
    'Community Food Bank Support',
    'Regular volunteer coordination for food sorting, distribution, and outreach to families in need.',
    '600 Service Street, Food Bank Warehouse',
    '2026-08-15'
  ),
  (
    3,
    'Homeless Shelter Assistance Program',
    'Coordinated volunteer efforts providing meal service, supply management, and supportive care at local shelters.',
    '700 Hope Avenue, Shelter Facility',
    '2026-10-10'
  ),
  (
    3,
    'Senior Technology Training Classes',
    'Educational programs teaching digital literacy, online safety, and technology skills to elderly community members.',
    '880 Digital Street, Senior Learning Center',
    '2026-09-10'
  );

SELECT * FROM service_project;

-- Categories Table -----------------
-- ----------------------------------

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO category (category_name)
VALUES
    ('Infrastructure'),
    ('Education'),
    ('Sustainability'),
    ('Youth Services'),
    ('Senior Support'),
    ('Food Security'),
    ('Accessibility'),
    ('Community Outreach'),
    ('Technology');

SELECT * FROM category;

-- Project Categories Table ---------
-- ----------------------------------

CREATE TABLE project_category (
    service_project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (service_project_id, category_id),
    FOREIGN KEY (service_project_id) REFERENCES service_project(service_project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);

INSERT INTO project_category (service_project_id, category_id)
VALUES
    -- Community Playground Renovation -> Infrastructure, Community Outreach
    (1, 1),
    (1, 8),
    -- School Roof Repair and Reinforcement -> Infrastructure, Education
    (2, 1),
    (2, 2),
    -- Bridge Restoration Project -> Infrastructure, Community Outreach
    (3, 1),
    (3, 8),
    -- Community Center Accessibility Upgrade -> Infrastructure, Accessibility
    (4, 1),
    (4, 7),
    -- Library Renovation and Technology Integration -> Education, Technology
    (5, 2),
    (5, 9),
    -- Urban Garden Initiative -> Sustainability, Infrastructure
    (6, 3),
    (6, 1),
    -- School Garden and Nutrition Education -> Sustainability, Education
    (7, 3),
    (7, 2),
    -- Rooftop Farming Initiative -> Sustainability, Infrastructure
    (8, 3),
    (8, 1),
    -- Community Seed Bank and Composting Center -> Sustainability, Food Security
    (9, 3),
    (9, 6),
    -- Neighborhood Composting Education Program -> Sustainability, Community Outreach
    (10, 3),
    (10, 8),
    -- Seniors Support Program -> Senior Support, Community Outreach
    (11, 5),
    (11, 8),
    -- Youth Mentorship Initiative -> Youth Services, Education
    (12, 4),
    (12, 2),
    -- Community Food Bank Support -> Food Security, Community Outreach
    (13, 6),
    (13, 8),
    -- Homeless Shelter Assistance Program -> Food Security, Community Outreach
    (14, 6),
    (14, 8),
    -- Senior Technology Training Classes -> Senior Support, Technology
    (15, 5),
    (15, 9);

SELECT * FROM project_category;