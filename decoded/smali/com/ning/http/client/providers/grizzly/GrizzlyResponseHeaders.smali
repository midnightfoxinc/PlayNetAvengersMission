.class public Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;
.super Lcom/ning/http/client/HttpResponseHeaders;
.source "GrizzlyResponseHeaders.java"


# instance fields
.field private final headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

.field private volatile initialized:Z

.field private final response:Lorg/glassfish/grizzly/http/HttpResponsePacket;


# direct methods
.method public constructor <init>(Lorg/glassfish/grizzly/http/HttpResponsePacket;)V
    .locals 1
    .param p1, "response"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/ning/http/client/HttpResponseHeaders;-><init>()V

    .line 32
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 42
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 44
    return-void
.end method


# virtual methods
.method public getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 7

    .prologue
    .line 52
    iget-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->initialized:Z

    if-nez v2, :cond_1

    .line 53
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    monitor-enter v3

    .line 54
    :try_start_0
    iget-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->initialized:Z

    if-nez v2, :cond_0

    .line 55
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->initialized:Z

    .line 56
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v2}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getHeaders()Lorg/glassfish/grizzly/http/util/MimeHeaders;

    move-result-object v0

    .line 57
    .local v0, "headersLocal":Lorg/glassfish/grizzly/http/util/MimeHeaders;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 58
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->getName(I)Lorg/glassfish/grizzly/http/util/DataChunk;

    move-result-object v4

    sget-object v5, Lorg/glassfish/grizzly/utils/Charsets;->ASCII_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Lorg/glassfish/grizzly/http/util/DataChunk;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->getValue(I)Lorg/glassfish/grizzly/http/util/DataChunk;

    move-result-object v5

    sget-object v6, Lorg/glassfish/grizzly/utils/Charsets;->ASCII_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v6}, Lorg/glassfish/grizzly/http/util/DataChunk;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 57
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 62
    .end local v0    # "headersLocal":Lorg/glassfish/grizzly/http/util/MimeHeaders;
    .end local v1    # "i":I
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    return-object v2

    .line 62
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method
