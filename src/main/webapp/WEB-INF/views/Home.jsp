<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Dashboard | AceBank</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
            <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css">
            <style>
                /* ===== PAGE BACKGROUND — matches login page ===== */
                body {
                    background: linear-gradient(135deg, #060d16, #0a1628, #0f2027) !important;
                    background-size: 400% 400% !important;
                    animation: dashGrad 12s ease infinite !important;
                    overflow-x: hidden;
                    margin: 0;
                    padding: 0;
                }

                @keyframes dashGrad {
                    0% {
                        background-position: 0% 50%;
                    }

                    50% {
                        background-position: 100% 50%;
                    }

                    100% {
                        background-position: 0% 50%;
                    }
                }


                /* ===== FLOATING MONEY ANIMATION ===== */
                .money-float {
                    position: fixed;
                    font-size: 28px;
                    opacity: 0.06;
                    z-index: 0;
                    pointer-events: none;
                    animation: moneyDrift linear infinite;
                }

                @keyframes moneyDrift {
                    0% {
                        transform: translateY(110vh) rotate(0deg);
                        opacity: 0;
                    }

                    10% {
                        opacity: 0.07;
                    }

                    90% {
                        opacity: 0.07;
                    }

                    100% {
                        transform: translateY(-10vh) rotate(720deg);
                        opacity: 0;
                    }
                }

                .mf1 {
                    left: 5%;
                    animation-duration: 18s;
                    font-size: 32px;
                }

                .mf2 {
                    left: 15%;
                    animation-duration: 22s;
                    animation-delay: 3s;
                    font-size: 24px;
                }

                .mf3 {
                    left: 25%;
                    animation-duration: 20s;
                    animation-delay: 6s;
                    font-size: 36px;
                }

                .mf4 {
                    left: 40%;
                    animation-duration: 25s;
                    animation-delay: 2s;
                    font-size: 20px;
                }

                .mf5 {
                    left: 55%;
                    animation-duration: 19s;
                    animation-delay: 8s;
                    font-size: 30px;
                }

                .mf6 {
                    left: 65%;
                    animation-duration: 23s;
                    animation-delay: 5s;
                    font-size: 26px;
                }

                .mf7 {
                    left: 78%;
                    animation-duration: 21s;
                    animation-delay: 1s;
                    font-size: 34px;
                }

                .mf8 {
                    left: 88%;
                    animation-duration: 17s;
                    animation-delay: 7s;
                    font-size: 22px;
                }

                /* ===== PARTICLE CANVAS ===== */
                #home-particles {
                    position: fixed;
                    inset: 0;
                    z-index: 0;
                    pointer-events: none;
                }

                /* ===== FLOATING ORBS — same as loan page ===== */
                .home-orb {
                    position: fixed;
                    border-radius: 50%;
                    filter: blur(90px);
                    opacity: 0.25;
                    z-index: 0;
                    pointer-events: none;
                }

                .home-orb-1 {
                    width: 400px;
                    height: 400px;
                    background: radial-gradient(circle, #00c6ff, transparent 70%);
                    top: -80px;
                    right: -60px;
                    left: auto;
                    animation: hOrb1 14s ease-in-out infinite;
                }

                .home-orb-2 {
                    width: 350px;
                    height: 350px;
                    background: radial-gradient(circle, #7b2ff7, transparent 70%);
                    bottom: 5%;
                    left: -80px;
                    right: auto;
                    animation: hOrb2 18s ease-in-out infinite;
                }

                .home-orb-3 {
                    width: 260px;
                    height: 260px;
                    background: radial-gradient(circle, #00ffa3, transparent 70%);
                    top: 55%;
                    right: 10%;
                    left: auto;
                    animation: hOrb3 20s ease-in-out infinite;
                }

                @keyframes hOrb1 {

                    0%,
                    100% {
                        transform: translate(0, 0) scale(1);
                    }

                    50% {
                        transform: translate(-50px, 70px) scale(1.08);
                    }
                }

                @keyframes hOrb2 {

                    0%,
                    100% {
                        transform: translate(0, 0) scale(1);
                    }

                    50% {
                        transform: translate(60px, -50px) scale(1.1);
                    }
                }

                @keyframes hOrb3 {

                    0%,
                    100% {
                        transform: translate(0, 0) scale(1);
                    }

                    50% {
                        transform: translate(-40px, 60px) scale(1.05);
                    }
                }

                /* ===== LAYOUT: TOP NAV + MAIN ===== */
                .dash-layout {
                    display: flex;
                    flex-direction: column;
                    min-height: 100vh;
                    position: relative;
                    z-index: 1;
                }

                /* ---- DASH HEADER ---- */
                .dash-header {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 0 40px;
                    height: 80px;
                    background: rgba(6, 13, 22, 0.8);
                    backdrop-filter: blur(20px);
                    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
                    position: sticky;
                    top: 0;
                    z-index: 20;
                }

                .header-left {
                    display: flex;
                    align-items: center;
                    gap: 40px;
                }

                .header-logo {
                    font-size: 24px;
                    font-weight: 800;
                    color: white;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .header-logo span {
                    color: #00c6ff;
                }

                .header-logo i {
                    font-size: 26px;
                    color: #00c6ff;
                }

                .header-nav {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .nav-link {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    text-decoration: none;
                    color: rgba(255, 255, 255, 0.6);
                    font-size: 14px;
                    font-weight: 500;
                    padding: 8px 16px;
                    border-radius: 12px;
                    transition: all 0.3s ease;
                }

                .nav-link i {
                    font-size: 18px;
                }

                .nav-link:hover {
                    color: white;
                    background: rgba(255, 255, 255, 0.06);
                }

                .nav-link.active {
                    color: #00c6ff;
                    background: rgba(0, 198, 255, 0.08);
                    font-weight: 600;
                }

                .header-right {
                    display: flex;
                    align-items: center;
                    gap: 20px;
                }

                .user-badge {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    background: rgba(0, 198, 255, 0.08);
                    border: 1px solid rgba(0, 198, 255, 0.2);
                    padding: 6px 16px;
                    border-radius: 20px;
                }

                .user-badge .acc-no {
                    font-size: 12px;
                    font-weight: 600;
                    color: #00c6ff;
                }

                .user-badge .user-name {
                    font-size: 14px;
                    font-weight: 600;
                    color: white;
                    border-left: 1px solid rgba(255, 255, 255, 0.2);
                    padding-left: 12px;
                }

                .logout-btn {
                    width: 40px;
                    height: 40px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 50%;
                    background: rgba(255, 77, 106, 0.1);
                    color: #ff4d6a;
                    text-decoration: none;
                    transition: all 0.3s ease;
                }

                .logout-btn:hover {
                    background: #ff4d6a;
                    color: white;
                }

                /* ---- MAIN CONTENT ---- */
                .dash-main {
                    flex: 1;
                    padding: 32px 40px;
                    max-width: 1400px;
                    margin: 0 auto;
                    width: 100%;
                }

                /* ---- DASHBOARD CONTENT ---- */
                .dash-content {
                    padding: 32px 40px;
                    animation: fadeIn 0.8s ease;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                /* ---- PROFILE BAR ---- */
                .profile-bar {
                    background: linear-gradient(135deg, #0a1628, #0f2027, #162a3a);
                    backdrop-filter: blur(20px);
                    border-radius: 20px;
                    padding: 24px 32px;
                    margin-bottom: 24px;
                    border: 1px solid rgba(0, 198, 255, 0.18);
                    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5), 0 0 30px rgba(0, 198, 255, 0.06);
                    display: flex;
                    align-items: center;
                    gap: 20px;
                    animation: fadeIn 0.8s ease;
                }

                .profile-bar-icon {
                    width: 60px;
                    height: 60px;
                    border-radius: 16px;
                    background: rgba(0, 198, 255, 0.12);
                    color: #00c6ff;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 30px;
                    flex-shrink: 0;
                }

                .profile-bar-details h2 {
                    margin: 0;
                    color: white;
                    font-size: 24px;
                    font-weight: 700;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .wave-icon {
                    display: inline-block;
                    font-style: normal;
                    animation: waveHand 1.8s ease-in-out infinite;
                    transform-origin: 70% 70%;
                    font-size: 26px;
                }

                @keyframes waveHand {

                    0%,
                    100% {
                        transform: rotate(0deg);
                    }

                    15% {
                        transform: rotate(14deg);
                    }

                    30% {
                        transform: rotate(-8deg);
                    }

                    45% {
                        transform: rotate(14deg);
                    }

                    60% {
                        transform: rotate(-4deg);
                    }

                    75% {
                        transform: rotate(10deg);
                    }
                }

                .profile-bar-details p {
                    margin: 4px 0 0;
                    color: rgba(255, 255, 255, 0.6);
                    font-size: 15px;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .profile-bar-details p span {
                    color: #00c6ff;
                    font-weight: 600;
                    letter-spacing: 1px;
                }

                /* ---- FLOATING MONEY BANNER ---- */
                .money-float-banner {
                    position: fixed;
                    bottom: 28px;
                    right: 30px;
                    z-index: 10;
                    display: flex;
                    gap: 10px;
                    pointer-events: none;
                }

                .money-float-note {
                    width: 90px;
                    height: 42px;
                    border-radius: 8px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-weight: 800;
                    font-size: 13px;
                    color: white;
                    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.35);
                    opacity: 0.88;
                }

                .mfn-1 {
                    background: linear-gradient(135deg, #00c6ff, #0072ff);
                    animation: mfnBob 3s ease-in-out infinite;
                }

                .mfn-2 {
                    background: linear-gradient(135deg, #00ffa3, #00c853);
                    animation: mfnBob 3.5s 0.4s ease-in-out infinite;
                }

                .mfn-3 {
                    background: linear-gradient(135deg, #7b2ff7, #b57aff);
                    animation: mfnBob 4s 0.8s ease-in-out infinite;
                }

                @keyframes mfnBob {

                    0%,
                    100% {
                        transform: translateY(0) rotate(-1deg);
                    }

                    50% {
                        transform: translateY(-10px) rotate(1.5deg);
                    }
                }

                /* ---- CARD GRID ---- */
                .card-grid {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    gap: 24px;
                    margin-bottom: 32px;
                }

                .dash-card {
                    background: linear-gradient(135deg, #0a1628, #0f2027, #162a3a);
                    backdrop-filter: blur(20px);
                    border-radius: 20px;
                    padding: 28px;
                    min-height: 200px;
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                    border: 1px solid rgba(0, 198, 255, 0.18);
                    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5), 0 0 30px rgba(0, 198, 255, 0.06);
                    position: relative;
                    overflow: hidden;
                    animation: cardFloat 6s ease-in-out infinite;
                }

                .dash-card:nth-child(2) {
                    animation-delay: 1.5s;
                }

                .dash-card:nth-child(3) {
                    animation-delay: 3s;
                }

                .dash-card:nth-child(4) {
                    animation-delay: 4.5s;
                }

                @keyframes cardFloat {

                    0%,
                    100% {
                        transform: translateY(0);
                    }

                    50% {
                        transform: translateY(-8px);
                    }
                }

                .dash-card::before {
                    content: '';
                    position: absolute;
                    left: 0;
                    top: 0;
                    bottom: 0;
                    width: 4px;
                    border-radius: 20px 0 0 20px;
                }

                .dash-card:hover {
                    transform: translateY(-6px) scale(1.01);
                    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.35);
                    border-color: rgba(255, 255, 255, 0.1);
                }

                /* Card shimmer on hover */
                .dash-card::after {
                    content: '';
                    position: absolute;
                    top: -50%;
                    left: -50%;
                    width: 200%;
                    height: 200%;
                    background: linear-gradient(45deg, transparent 30%, rgba(255, 255, 255, 0.03) 50%, transparent 70%);
                    transform: translateX(-100%) rotate(25deg);
                    transition: transform 0.6s ease;
                    pointer-events: none;
                }

                .dash-card:hover::after {
                    transform: translateX(100%) rotate(25deg);
                }

                /* Card type accent colors */
                .dash-card-balance::before {
                    background: #00c6ff;
                }

                .dash-card-deposit::before {
                    background: #00ffa3;
                }

                .dash-card-transfer::before {
                    background: #7b2ff7;
                }

                .dash-card-withdraw::before {
                    background: #ff4d6a;
                }

                .dash-card-header {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    margin-bottom: 16px;
                }

                .dash-card-icon {
                    width: 46px;
                    height: 46px;
                    border-radius: 14px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 22px;
                    flex-shrink: 0;
                    transition: transform 0.3s ease;
                }

                .dash-card:hover .dash-card-icon {
                    transform: scale(1.1);
                }

                .dash-card-icon.icon-balance {
                    background: rgba(0, 198, 255, 0.12);
                    color: #00c6ff;
                }

                .dash-card-icon.icon-deposit {
                    background: rgba(0, 255, 163, 0.12);
                    color: #00ffa3;
                }

                .dash-card-icon.icon-transfer {
                    background: rgba(123, 47, 247, 0.12);
                    color: #7b2ff7;
                }

                .dash-card-icon.icon-withdraw {
                    background: rgba(255, 77, 106, 0.12);
                    color: #ff4d6a;
                }

                .dash-card-header h3 {
                    font-size: 16px;
                    font-weight: 600;
                    margin: 0;
                    color: white;
                }

                .balance-value {
                    font-size: 36px;
                    font-weight: 800;
                    margin: 8px 0;
                    background: linear-gradient(135deg, #00c6ff, #7b2ff7, #00ffa3);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                    letter-spacing: -0.5px;
                }

                .balance-label {
                    font-size: 13px;
                    color: rgba(255, 255, 255, 0.45);
                }

                /* ---- FORM STYLES ---- */
                .dash-card input {
                    background: rgba(255, 255, 255, 0.08) !important;
                    border: 1px solid rgba(255, 255, 255, 0.08) !important;
                    color: white !important;
                    border-radius: 12px;
                    padding: 12px 16px;
                    font-size: 14px;
                    transition: all 0.3s ease;
                }

                .dash-card input:focus {
                    border-color: #00c6ff !important;
                    box-shadow: 0 0 0 3px rgba(0, 198, 255, 0.15);
                    outline: none;
                }

                .dash-card input::placeholder {
                    color: rgba(255, 255, 255, 0.35) !important;
                }

                .dash-card button {
                    margin-top: 8px;
                    width: 100%;
                    padding: 12px;
                    font-size: 14px;
                    border-radius: 12px;
                }

                .btn-danger {
                    background: linear-gradient(135deg, #ff4d6a, #cc0033) !important;
                }

                .btn-danger:hover {
                    box-shadow: 0 8px 20px rgba(255, 77, 51, 0.3) !important;
                }

                /* ---- TRANSACTIONS SECTION ---- */
                .dash-txn-section {
                    background: linear-gradient(135deg, #0a1628, #0f2027, #162a3a);
                    backdrop-filter: blur(20px);
                    border-radius: 20px;
                    border: 1px solid rgba(0, 198, 255, 0.18);
                    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5), 0 0 30px rgba(0, 198, 255, 0.06);
                    overflow: hidden;
                }

                .dash-txn-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 24px 28px 18px;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
                    position: relative;
                }

                .dash-txn-header::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 3px;
                    background: linear-gradient(135deg, #00c6ff, #0072ff);
                }

                .dash-txn-header h3 {
                    font-size: 18px;
                    font-weight: 600;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    margin: 0;
                    color: white;
                }

                .dash-txn-header h3 i {
                    color: #00c6ff;
                }

                .dash-txn-body {
                    padding: 0 28px 24px;
                }

                /* Responsive */
                @media (max-width: 1024px) {
                    .dash-header {
                        padding: 0 20px;
                    }

                    .header-left {
                        gap: 20px;
                    }

                    .nav-link span {
                        display: none;
                    }

                    .user-name {
                        display: none;
                    }

                    .dash-main {
                        padding: 24px 20px;
                    }

                    .card-grid {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
        </head>

        <body>

            <!-- Floating Money Animation -->
            <div class="money-float mf1">₹</div>
            <div class="money-float mf2">$</div>
            <div class="money-float mf3">€</div>
            <div class="money-float mf4">£</div>
            <div class="money-float mf5">¥</div>
            <div class="money-float mf6">₹</div>
            <div class="money-float mf7">$</div>
            <div class="money-float mf8">€</div>


            <!-- Background Layers -->
            <canvas id="home-particles"></canvas>
            <div class="home-orb home-orb-1"></div>
            <div class="home-orb home-orb-2"></div>
            <div class="home-orb home-orb-3"></div>



            <!-- Background Video -->

            <video autoplay muted loop playsinline class="bg-video">
                <source src="${pageContext.request.contextPath}/assets/bg-video.mp4" type="video/mp4">
            </video>

            <!-- ===== LAYOUT ===== -->
            <div class="dash-layout">

                <!-- HEADER -->
                <header class="dash-header">
                    <div class="header-left">
                        <a href="${pageContext.request.contextPath}/" class="header-logo">
                            <i class="ri-bank-fill"></i> Ace<span>Bank</span>
                        </a>

                        <nav class="header-nav">
                            <a href="${pageContext.request.contextPath}/home" class="nav-link active">
                                <i class="ri-dashboard-3-line"></i> <span>Dashboard</span>
                            </a>
                            <a href="${pageContext.request.contextPath}/LoanRequest" class="nav-link">
                                <i class="ri-bank-line"></i> <span>Apply for Loan</span>
                            </a>
                            <a href="ChangePassword.jsp" class="nav-link">
                                <i class="ri-lock-password-line"></i> <span>Change Password</span>
                            </a>
                        </nav>
                    </div>

                    <div class="header-right">

                        <a href="Logout" class="logout-btn" title="Logout">
                            <i class="ri-logout-box-r-line"></i>
                        </a>
                    </div>
                </header>

                <!-- MAIN CONTENT -->
                <div class="dash-main">

                    <!-- DASHBOARD CARDS -->
                    <div class="dash-content" style="padding:0;">

                        <div
                            style="display:inline-flex; align-items:center; background:linear-gradient(135deg, #0a1628, #0f2027, #162a3a); border: 1px solid rgba(0, 198, 255, 0.18); border-radius:30px; padding:12px 24px; box-shadow:0 15px 35px rgba(0,0,0,0.4), 0 0 20px rgba(0,198,255,0.06); margin-bottom: 24px;">
                            <span
                                style="font-size:16px; font-weight:600; color:#00c6ff; display:flex; align-items:center; gap:8px;">
                                <i class="ri-user-line" style="font-size:18px;"></i> ${sessionScope.accountNumber}
                            </span>
                            <div style="width:1px; height:20px; background:rgba(255,255,255,0.15); margin:0 16px;">
                            </div>
                            <span style="font-size:18px; font-weight:700; color:white;">
                                ${sessionScope.firstName} <i class="wave-icon"
                                    style="font-size:20px; margin-left:4px;">👋</i>
                            </span>
                        </div>

                        <div class="card-grid">

                            <%-- 1. Balance Card --%>
                                <div class="dash-card dash-card-balance">
                                    <div class="dash-card-header">
                                        <div class="dash-card-icon icon-balance"><i class="ri-wallet-3-line"></i>
                                        </div>
                                        <h3>Total Balance</h3>
                                    </div>
                                    <div class="balance-value">₹ <span
                                            id="balance-counter">${sessionScope.balance}</span></div>
                                    <p class="balance-label">Available for withdrawal & transfers</p>
                                </div>

                                <%-- 2. Deposit Card --%>
                                    <div class="dash-card dash-card-deposit">
                                        <div class="dash-card-header">
                                            <div class="dash-card-icon icon-deposit"><i class="ri-add-circle-line"></i>
                                            </div>
                                            <h3>Quick Deposit</h3>
                                        </div>
                                        <form action="home" method="post">
                                            <input type="text" name="deposit" placeholder="Enter amount to add (₹)"
                                                pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required />
                                            <button type="submit"><i class="ri-add-line" style="margin-right:4px;"></i>
                                                Add to Balance</button>
                                        </form>
                                    </div>

                                    <%-- 3. Transfer Card --%>
                                        <div class="dash-card dash-card-transfer">
                                            <div class="dash-card-header">
                                                <div class="dash-card-icon icon-transfer"><i
                                                        class="ri-send-plane-line"></i></div>
                                                <h3>Send Money</h3>
                                            </div>
                                            <form action="home" method="post">
                                                <input type="text" name="toAccount" placeholder="Recipient Account No"
                                                    required />
                                                <input type="text" name="toAmount" placeholder="Amount (₹)"
                                                    pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required />
                                                <button type="submit"><i class="ri-send-plane-fill"
                                                        style="margin-right:4px;"></i> Transfer Now</button>
                                            </form>
                                        </div>

                                        <%-- 4. Withdraw Card --%>
                                            <div class="dash-card dash-card-withdraw">
                                                <div class="dash-card-header">
                                                    <div class="dash-card-icon icon-withdraw"><i
                                                            class="ri-money-dollar-circle-line"></i></div>
                                                    <h3>Withdraw Money</h3>
                                                </div>
                                                <form action="home" method="post">
                                                    <input type="text" name="withdraw"
                                                        placeholder="Enter amount to withdraw (₹)"
                                                        pattern="[0-9]*\.?[0-9]+" inputmode="decimal" required />
                                                    <button type="submit" class="btn-danger"><i
                                                            class="ri-arrow-down-circle-line"
                                                            style="margin-right:4px;"></i> Withdraw Now</button>
                                                </form>
                                            </div>
                        </div>

                        <%-- Transactions Table --%>
                            <div class="dash-txn-section">
                                <div class="dash-txn-header">
                                    <h3><i class="ri-exchange-line"></i> Recent Transactions</h3>
                                    <button class="download-btn"><i class="ri-download-2-line"></i> Download
                                        CSV</button>
                                </div>
                                <div class="dash-txn-body">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Type</th>
                                                <th>Reference</th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="tx" items="${sessionScope.transactionDetailsList}">
                                                <tr>
                                                    <td>${tx.createdAt()}</td>
                                                    <td>
                                                        <span
                                                            class="badge-${tx.txType().toLowerCase()}">${tx.txType()}</span>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${tx.txType() == 'TRANSFER'}">
                                                                <span class="ref-text">
                                                                    ${tx.senderAccount() ==
                                                                    sessionScope.accountNumber ?
                                                                    'To' : 'From'}
                                                                    ${tx.senderAccount() ==
                                                                    sessionScope.accountNumber ?
                                                                    tx.receiverAccount() : tx.senderAccount()}
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="remark-text">${tx.remark()}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>₹${tx.amount()}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>

                </div>
            </div>

            <script src="${pageContext.request.contextPath}/js/style.js"></script>

            <!-- Particle Network Animation -->
            <script>
                (function () {
                    const canvas = document.getElementById('home-particles');
                    const ctx = canvas.getContext('2d');
                    let w, h, particles;
                    const PARTICLE_COUNT = 60;
                    const MAX_DIST = 120;

                    function resize() {
                        w = canvas.width = window.innerWidth;
                        h = canvas.height = window.innerHeight;
                    }

                    function createParticles() {
                        particles = [];
                        for (let i = 0; i < PARTICLE_COUNT; i++) {
                            particles.push({
                                x: Math.random() * w,
                                y: Math.random() * h,
                                vx: (Math.random() - 0.5) * 0.5,
                                vy: (Math.random() - 0.5) * 0.5,
                                r: Math.random() * 2 + 1
                            });
                        }
                    }

                    function draw() {
                        ctx.clearRect(0, 0, w, h);

                        for (let i = 0; i < particles.length; i++) {
                            for (let j = i + 1; j < particles.length; j++) {
                                const dx = particles[i].x - particles[j].x;
                                const dy = particles[i].y - particles[j].y;
                                const dist = Math.sqrt(dx * dx + dy * dy);
                                if (dist < MAX_DIST) {
                                    const alpha = (1 - dist / MAX_DIST) * 0.2;
                                    ctx.strokeStyle = 'rgba(0,198,255,' + alpha + ')';
                                    ctx.lineWidth = 0.7;
                                    ctx.beginPath();
                                    ctx.moveTo(particles[i].x, particles[i].y);
                                    ctx.lineTo(particles[j].x, particles[j].y);
                                    ctx.stroke();
                                }
                            }
                        }

                        for (const p of particles) {
                            ctx.beginPath();
                            ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
                            ctx.fillStyle = 'rgba(0,198,255,0.45)';
                            ctx.fill();

                            p.x += p.vx;
                            p.y += p.vy;

                            if (p.x < 0 || p.x > w) p.vx *= -1;
                            if (p.y < 0 || p.y > h) p.vy *= -1;
                        }

                        requestAnimationFrame(draw);
                    }

                    window.addEventListener('resize', function () {
                        resize();
                        createParticles();
                    });

                    resize();
                    createParticles();
                    draw();
                })();
            </script>

        </body>

        </html>