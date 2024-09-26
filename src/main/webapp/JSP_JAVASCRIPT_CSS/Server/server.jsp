<%-- 
    Document   : server
    Created on : May 24, 2024, 1:10:55 AM
    Author     : ASUS
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Info Table</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                background-color: #AEC6CF;
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            
            td {
                background-color: #3EB489;
            }
        </style>
    </head>

    <%
        ArrayList<ArrayList<Integer>> order_info = (ArrayList<ArrayList<Integer>>) request.getAttribute("order_info");
        Map<Integer, String> optionsMap = new HashMap<>();

        // Add key-value pairs
        optionsMap.put(0, "confirming");
        optionsMap.put(1, "shipping");
        optionsMap.put(2, "delivering");
        optionsMap.put(3, "canceled");


    %>

    <body>

        <h2>Order Info Table</h2>

        <table>
            <tr>
                <th>id_order</th>
                <th>id_user</th>
                <th>status</th>
            </tr>
            <%  for (int i = 0; i < order_info.size(); i++) {

            %>
            <tr>
                <td id="order_id_<%= i%>"><%=order_info.get(i).get(1)%></td>
                <td id="user_id_<%= i%>"><%=order_info.get(i).get(0)%></td>
                <td class="select-column">
                    <select class="selection" onchange="confirmUpdate(this)">
                        <%
                            // Get the status code from order_info and set it as default value
                            int statusCode = order_info.get(i).get(2);
                            String statusString = optionsMap.get(statusCode);
                        %>
                        <option value="<%= statusCode%>" selected><%= statusString%></option>
                        <%
                            // Generate options based on optionsMap
                            for (Map.Entry<Integer, String> entry : optionsMap.entrySet()) {
                                int code = entry.getKey();
                                String status = entry.getValue();
                                // Skip the selected option as it's already added
                        if (code != statusCode) {%>
                        <option value="<%= code%>"><%= status%></option>
                        <% } %>
                        <% } %>
                    </select>
                </td>
            </tr>
            <%}%>
        </table>

    </body>

    <script>


        function confirmUpdate(ele) {
            let status = 0;
            if (ele.value == "0") {
                status = 0
            }
            if (ele.value == "1") {
                status = 1
            }
            if (ele.value == "2") {
                status = 2
            }
            if (ele.value == "3") {
                status = 3
            }
            let text = "Are you sure to update the status?";
            if (confirm(text) == true) {
                fetch('http://localhost:8080/Jewelry_web/server', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({order_id: ele.parentElement.previousElementSibling.previousElementSibling.innerHTML, status: status})
                })
            } else {
                text = "You canceled!";
            }
        }
        // Function to populate the selection dropdown

    </script>
</html>
