<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Simple Network</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="button-60 me-3" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="button-60 me-3" aria-current="page" href="/greeting">Messages</a>
                </li>
                <#if isAdmin>
                    <li class="nav-item">
                        <a class="button-60 me-3" aria-current="page" href="/user">User list</a>
                    </li>
                </#if>
            </ul>
            <div class="navbar-text me-2">
                ${name!}
            </div>
            <@l.logout />
        </div>
    </div>
</nav>