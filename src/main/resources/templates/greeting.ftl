<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="input-group mb-3 mt-3">
        <div >
            <form method="get" action="/greeting" class="form-check-inline">
                <input class="custom-text-area" type="text" name="filter" value="${filter!}" placeholder="Serch by tag">
                <button class="button-60" type="submit" >Serch</button>
            </form>
        </div>
    </div>
    <a class="button-60" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="input-group mb-3">
        <form class="collapse" id="collapseExample" method="post" enctype="multipart/form-data">
                <div class="input-group mb-3 mt-3">
                    <div class="input-group mb-3">
                        <input type="text" name="text" class="form-control" placeholder="Write in your message" aria-label="message" aria-describedby="basic-addon2">
                    </div>
                    <div class="input-group mb-3">
                        <input type="file" name="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                        <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">Button</button>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon2">#</span>
                        <input type="text" name="tag" class="form-control" placeholder="Write in #Tag" aria-label="Tag" aria-describedby="basic-addon2">
                        <button class="button-60" type="submit" name="submit" style="line-height: inherit">Разместить</button>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </div>
        </form>
    </div>
    <div class="card-group">
        <#list messages as message>
            <div class="card my-3" style="width: 18rem;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text} </span>
                    <i>#${message.tag} </i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>