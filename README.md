<h1>E-Commerce Application</h1>

<p>
    This is a full-stack application with Node.js handling the backend and React.js managing the frontend. For the database management, the backend connects to a MySQL database.
</p>

<h2>Prerequisites</h2>

<p>Before you start, make sure you have the following installed on your machine:</p>

<ul>
    <li><a href="https://nodejs.org/">Node.js</a> (includes npm)</li>
    <li><a href="https://www.mysql.com/">MySQL</a></li>
    <li><a href="https://www.gnu.org/software/make/">Make</a> 
        (optional, but recommended for easier command navigation)
    </li>
</ul>

<h2>Setup</h2>

<h3>1. Clone the Repository</h3>

<pre>
git clone https://github.com/your-username/ecomm.git
cd ecomm
</pre>

<h3>2. Configure the Backend</h3>

<p>Navigate to the <code>backend</code> directory and create a <code>.env</code> file with your MySQL database credentials:</p>

<pre>
<code># backend/.env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=password
DB_NAME=database_name
PORT=3001</code>
</pre>

<h3>3. Install Dependencies</h3>

<p>Run the following command to install dependencies for both the backend and frontend:</p>

<pre>
<code>make install-all</code>
</pre>

<h3>4. Start the Application</h3>

<p>To start both the backend and frontend servers, run:</p>

<pre>
<code>make start-all</code>
</pre>

<p>This command will:</p>

<ul>
  <li>Check the operating system (Linux or Windows)</li>
  <li>Check the status of the MySQL database service and start it if necessary</li>
  <li>Start the backend server</li>
  <li>Start the frontend server</li>
</ul>

<h3>5. Manually Starting the Servers (Optional)</h3>

<p>If you prefer, you can start the backend and frontend servers manually:</p>

<h4>Start the Backend</h4>

<pre>
<code>cd backend
npm start</code>
</pre>

<h4>Start the Frontend</h4>

<pre>
<code>cd frontend
npm start</code>
</pre>

<h3>6. Access the Application</h3>

<p>Once both servers are running, you can access the frontend of the application at:</p>

<pre>
<code>http://localhost:3000</code>
</pre>

<p>The frontend will proxy API requests to the backend running at <code>http://localhost:3001</code>.</p>