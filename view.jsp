<%@ page import="java.util.List" %>
<%@ page import="com.simple.model.Student" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student List</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            padding: 40px 20px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            gap: 20px;
            flex-wrap: wrap;
        }

        .header-left h1 {
            color: #333;
            margin-bottom: 6px;
        }

        .header-left p {
            color: #777;
            font-size: 14px;
        }

        .add-btn {
            padding: 12px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.3s;
        }

        .add-btn:hover {
            background: #5568d8;
            transform: translateY(-2px);
        }

        .table-wrapper {
            overflow-x: auto;
            border-radius: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        thead {
            background: #667eea;
            color: white;
        }

        th {
            padding: 15px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            color: #444;
            font-size: 14px;
        }

        tbody tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #f7f8ff;
        }

        .id-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            background: #eef0ff;
            color: #667eea;
            font-weight: bold;
        }

        .empty-message {
            text-align: center;
            padding: 40px;
            color: #777;
        }

        .footer {
            margin-top: 25px;
            text-align: center;
        }

        .back-link {
            color: #667eea;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            body {
                padding: 20px 10px;
            }

            .container {
                padding: 20px;
            }

            .header {
                align-items: flex-start;
                flex-direction: column;
            }

            .add-btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>

<body>

    <div class="container">

        <div class="header">

            <div class="header-left">
                <h1> Student List</h1>
                <p>All registered students</p>
            </div>

            <a href="index.jsp" class="add-btn">
                 Add Student
            </a>

        </div>

        <%
            List<Student> students =
                (List<Student>) request.getAttribute("students");
        %>

        <% if (students != null && !students.isEmpty()) { %>

            <div class="table-wrapper">

                <table>

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student Name</th>
                            <th>Email Address</th>
                        </tr>
                    </thead>

                    <tbody>

                        <% for (Student student : students) { %>

                            <tr>

                                <td>
                                    <span class="id-badge">
                                        <%= student.getId() %>
                                    </span>
                                </td>

                                <td>
                                    <%= student.getName() %>
                                </td>

                                <td>
                                    <%= student.getEmail() %>
                                </td>

                            </tr>

                        <% } %>

                    </tbody>

                </table>

            </div>

        <% } else { %>

            <div class="empty-message">
                <h3>No Students Found</h3>
                <p>There are no registered students yet.</p>
            </div>

        <% } %>

        <div class="footer">
            <a href="index.jsp" class="back-link">
                 Back to Registration
            </a>
        </div>

    </div>

</body>
</html>