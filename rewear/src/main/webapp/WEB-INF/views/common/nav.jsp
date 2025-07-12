<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) userName = "User";
%>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
    .navbar {
        background: linear-gradient(to right, #00c6ff, #0072ff);
    }

    .navbar-brand {
        font-weight: 700;
        font-size: 24px;
        color: white !important;
    }

    .nav-link {
        color: white !important;
        font-weight: 500;
        margin-right: 8px;
        padding: 8px 16px !important;
        border-radius: 25px;
        transition: all 0.3s ease;
    }

    .nav-link:hover,
    .nav-link:focus {
        background-color: rgba(255, 255, 255, 0.2);
        color: #fff !important;
    }

    .dropdown-menu {
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        border: none;
        border-radius: 10px;
    }

    .dropdown-menu .dropdown-item:hover {
        background-color: #f8f9fa;
        color: #0072ff;
    }

    .user-avatar {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 8px;
    }

    @media (max-width: 768px) {
        .nav-link {
            margin-right: 0;
            margin-bottom: 8px;
        }
    }
</style>

<nav class="navbar navbar-expand-lg shadow-sm sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/dashboard">
            <i class="bi bi-recycle"></i> ReWear
        </a>
        <button class="navbar-toggler bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#rewearNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="rewearNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link" href="/item/my">
                        <i class="bi bi-box-seam"></i> My Items
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/item/add">
                        <i class="bi bi-plus-circle"></i> Add Item
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/item/available">
                        <i class="bi bi-arrow-repeat"></i> Swap Items
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/swap/history">
                        <i class="bi bi-clock-history"></i> History
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/about">
                        <i class="bi bi-info-circle"></i> About
                    </a>
                </li>
            </ul>

            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/assets/brand/user.png" alt="Avatar" class="user-avatar" />
                        <span><%= userName %></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="/profile"><i class="bi bi-person"></i> Profile</a></li>
                        <li><a class="dropdown-item" href="/logout"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
