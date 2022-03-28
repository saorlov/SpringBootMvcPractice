<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="mb-3">
            <label class="col-sm-1 col-form-label">Login</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="username">
            </div>
        </div>
        <div class="mb-3">
            <label class="col-sm-1 col-form-label">Password</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" name="password">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if !isRegisterForm>
            <a href="/registration" class="button-60">Add new user</a>
        </#if>
        <button class="button-60 ms-3" type="submit"><#if isRegisterForm>Create new user<#else >Sign in</#if></button>
    </form>
</#macro>
<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="button-60 mx-2" type="submit">Sign out</button>
    </form>
</#macro>