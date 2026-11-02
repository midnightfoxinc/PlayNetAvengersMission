.class interface abstract Lcom/ning/http/client/providers/grizzly/StatusHandler;
.super Ljava/lang/Object;
.source "StatusHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;
    }
.end annotation


# virtual methods
.method public abstract handleStatus(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z
.end method

.method public abstract handlesStatus(I)Z
.end method
