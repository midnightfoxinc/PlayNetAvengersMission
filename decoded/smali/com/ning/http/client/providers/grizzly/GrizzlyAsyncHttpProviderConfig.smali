.class public Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProviderConfig.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHttpProviderConfig;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHttpProviderConfig",
        "<",
        "Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private final attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected connectionPool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->attributes:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;Ljava/lang/Object;)Lcom/ning/http/client/AsyncHttpProviderConfig;
    .locals 5
    .param p1, "name"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 105
    if-nez p1, :cond_1

    .line 125
    :cond_0
    :goto_0
    return-object p0

    .line 108
    :cond_1
    if-nez p2, :cond_3

    .line 109
    invoke-virtual {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->hasDefaultValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    iget-object p2, p1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->defaultValue:Ljava/lang/Object;

    .line 124
    :cond_2
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 115
    :cond_3
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->type:Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 116
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The value of property [%s] must be of type [%s].  Type of value provided: [%s]."

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->type:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic addProperty(Ljava/lang/Object;Ljava/lang/Object;)Lcom/ning/http/client/AsyncHttpProviderConfig;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 35
    check-cast p1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->addProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;Ljava/lang/Object;)Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionPool()Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->connectionPool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    return-object v0
.end method

.method public getProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .prologue
    .line 130
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->attributes:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 131
    .local v0, "ret":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 132
    invoke-virtual {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->hasDefaultValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 133
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->defaultValue:Ljava/lang/Object;

    .line 136
    :cond_0
    return-object v0
.end method

.method public bridge synthetic getProperty(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 35
    check-cast p1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->getProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public propertiesSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 149
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->attributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public removeProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .prologue
    .line 141
    if-nez p1, :cond_0

    .line 142
    const/4 v0, 0x0

    .line 144
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic removeProperty(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 35
    check-cast p1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->removeProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setConnectionPool(Lcom/ning/http/client/providers/grizzly/ConnectionPool;)V
    .locals 0
    .param p1, "connectionPool"    # Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->connectionPool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    .line 158
    return-void
.end method
