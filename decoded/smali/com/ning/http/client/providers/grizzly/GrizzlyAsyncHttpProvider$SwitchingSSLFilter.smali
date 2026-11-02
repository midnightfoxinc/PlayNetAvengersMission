.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;
.super Lorg/glassfish/grizzly/ssl/SSLFilter;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SwitchingSSLFilter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;
    }
.end annotation


# instance fields
.field final CONNECTION_IS_SECURE:Lorg/glassfish/grizzly/attributes/Attribute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/attributes/Attribute",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final secureByDefault:Z


# direct methods
.method constructor <init>(Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;Z)V
    .locals 2
    .param p1, "clientConfig"    # Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;
    .param p2, "secureByDefault"    # Z

    .prologue
    .line 2164
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/glassfish/grizzly/ssl/SSLFilter;-><init>(Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;)V

    .line 2155
    sget-object v0, Lorg/glassfish/grizzly/Grizzly;->DEFAULT_ATTRIBUTE_BUILDER:Lorg/glassfish/grizzly/attributes/AttributeBuilder;

    const-class v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/attributes/AttributeBuilder;->createAttribute(Ljava/lang/String;)Lorg/glassfish/grizzly/attributes/Attribute;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->CONNECTION_IS_SECURE:Lorg/glassfish/grizzly/attributes/Attribute;

    .line 2165
    iput-boolean p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->secureByDefault:Z

    .line 2167
    return-void
.end method

.method private isSecure(Lorg/glassfish/grizzly/Connection;)Z
    .locals 2
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 2216
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->CONNECTION_IS_SECURE:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v1, p1}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 2217
    .local v0, "secStatus":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 2218
    iget-boolean v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->secureByDefault:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 2220
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method


# virtual methods
.method public handleEvent(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/filterchain/FilterChainEvent;)Lorg/glassfish/grizzly/filterchain/NextAction;
    .locals 4
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "event"    # Lorg/glassfish/grizzly/filterchain/FilterChainEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2176
    invoke-interface {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainEvent;->type()Ljava/lang/Object;

    move-result-object v1

    const-class v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;

    if-ne v1, v2, :cond_0

    move-object v0, p2

    .line 2177
    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;

    .line 2178
    .local v0, "se":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->CONNECTION_IS_SECURE:Lorg/glassfish/grizzly/attributes/Attribute;

    iget-object v2, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;->connection:Lorg/glassfish/grizzly/Connection;

    iget-boolean v3, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;->secure:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/glassfish/grizzly/attributes/Attribute;->set(Lorg/glassfish/grizzly/attributes/AttributeStorage;Ljava/lang/Object;)V

    .line 2179
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getStopAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v1

    .line 2181
    .end local v0    # "se":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getInvokeAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v1

    goto :goto_0
.end method

.method public handleRead(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/filterchain/NextAction;
    .locals 1
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2188
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->isSecure(Lorg/glassfish/grizzly/Connection;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2189
    invoke-super {p0, p1}, Lorg/glassfish/grizzly/ssl/SSLFilter;->handleRead(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v0

    .line 2191
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getInvokeAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v0

    goto :goto_0
.end method

.method public handleWrite(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/filterchain/NextAction;
    .locals 1
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2198
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->isSecure(Lorg/glassfish/grizzly/Connection;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2199
    invoke-super {p0, p1}, Lorg/glassfish/grizzly/ssl/SSLFilter;->handleWrite(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v0

    .line 2201
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getInvokeAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v0

    goto :goto_0
.end method

.method public onFilterChainChanged(Lorg/glassfish/grizzly/filterchain/FilterChain;)V
    .locals 0
    .param p1, "filterChain"    # Lorg/glassfish/grizzly/filterchain/FilterChain;

    .prologue
    .line 2208
    return-void
.end method
