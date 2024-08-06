Para el CSS nos centramos en acomodar y darle color a cada elemento que conforma la página.
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fce9ab;
        }
        header {
            background-color: #a6e4dc;
            color: #070707;
            padding: 10px 0;
            text-align: center;
        }
        nav {
            margin: 10px 0;
            text-align: center;
        }
        nav a {
            color: #0c0c0c;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        section {
            padding: 20px;
            background: #fff;
            margin-top: 20px;
            border-radius: 8px;
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>