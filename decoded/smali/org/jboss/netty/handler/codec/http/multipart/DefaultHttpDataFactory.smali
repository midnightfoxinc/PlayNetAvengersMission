.class public Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;
.super Ljava/lang/Object;
.source "DefaultHttpDataFactory.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;


# static fields
.field public static final MAXSIZE:J = -0x1L

.field public static final MINSIZE:J = 0x4000L


# instance fields
.field private final checkSize:Z

.field private maxSize:J

.field private minSize:J

.field private final requestFileDeleteMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jboss/netty/handler/codec/http/HttpRequest;",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/HttpData;",
            ">;>;"
        }
    .end annotation
.end field

.field private final useDisk:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->useDisk:Z

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkSize:Z

    .line 65
    const-wide/16 v0, 0x4000

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->minSize:J

    .line 66
    return-void
.end method

.method public constructor <init>(J)V
    .locals 3
    .param p1, "minSize"    # J

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    .line 82
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->useDisk:Z

    .line 83
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkSize:Z

    .line 84
    iput-wide p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->minSize:J

    .line 85
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2
    .param p1, "useDisk"    # Z

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    .line 73
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->useDisk:Z

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkSize:Z

    .line 75
    return-void
.end method

.method private checkHttpDataSize(Lorg/jboss/netty/handler/codec/http/multipart/HttpData;)V
    .locals 4
    .param p1, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpData;

    .prologue
    .line 129
    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;->length()J

    move-result-wide v2

    invoke-interface {p1, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;->checkSize(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    return-void

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Attribute bigger than maxSize allowed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;
    .locals 2
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpRequest;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/HttpData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 96
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    if-nez v0, :cond_0

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .restart local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    :cond_0
    return-object v0
.end method


# virtual methods
.method public cleanAllHttpDatas()V
    .locals 6

    .prologue
    .line 215
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 216
    .local v4, "request":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 217
    .local v1, "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    if-eqz v1, :cond_1

    .line 218
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;

    .line 219
    .local v0, "data":Lorg/jboss/netty/handler/codec/http/multipart/HttpData;
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;->delete()V

    goto :goto_1

    .line 221
    .end local v0    # "data":Lorg/jboss/netty/handler/codec/http/multipart/HttpData;
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 223
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 225
    .end local v1    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    .end local v4    # "request":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    :cond_2
    return-void
.end method

.method public cleanRequestHttpDatas(Lorg/jboss/netty/handler/codec/http/HttpRequest;)V
    .locals 4
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .prologue
    .line 205
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->requestFileDeleteMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 206
    .local v1, "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    if-eqz v1, :cond_1

    .line 207
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;

    .line 208
    .local v0, "data":Lorg/jboss/netty/handler/codec/http/multipart/HttpData;
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;->delete()V

    goto :goto_0

    .line 210
    .end local v0    # "data":Lorg/jboss/netty/handler/codec/http/multipart/HttpData;
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 212
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .locals 4
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->useDisk:Z

    if-eqz v2, :cond_0

    .line 105
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;

    invoke-direct {v0, p2}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;-><init>(Ljava/lang/String;)V

    .line 106
    .local v0, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    .line 107
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;

    move-result-object v1

    .line 108
    .local v1, "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v1    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    :goto_0
    return-object v0

    .line 111
    :cond_0
    iget-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkSize:Z

    if-eqz v2, :cond_1

    .line 112
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->minSize:J

    invoke-direct {v0, p2, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;-><init>(Ljava/lang/String;J)V

    .line 113
    .restart local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    .line 114
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;

    move-result-object v1

    .line 115
    .restart local v1    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 118
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v1    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    :cond_1
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    invoke-direct {v0, p2}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;-><init>(Ljava/lang/String;)V

    .line 119
    .local v0, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;->setMaxSize(J)V

    goto :goto_0
.end method

.method public createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .locals 6
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->useDisk:Z

    if-eqz v3, :cond_0

    .line 139
    :try_start_0
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;

    invoke-direct {v0, p2, p3}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .local v0, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-interface {v0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_0
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkHttpDataSize(Lorg/jboss/netty/handler/codec/http/multipart/HttpData;)V

    .line 147
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;

    move-result-object v2

    .line 148
    .local v2, "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v2    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    :goto_1
    return-object v0

    .line 141
    :catch_0
    move-exception v1

    .line 143
    .local v1, "e":Ljava/io/IOException;
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->minSize:J

    invoke-direct {v0, p2, p3, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 144
    .restart local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-interface {v0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    goto :goto_0

    .line 151
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkSize:Z

    if-eqz v3, :cond_1

    .line 152
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->minSize:J

    invoke-direct {v0, p2, p3, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 153
    .restart local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-interface {v0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    .line 154
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkHttpDataSize(Lorg/jboss/netty/handler/codec/http/multipart/HttpData;)V

    .line 155
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;

    move-result-object v2

    .line 156
    .restart local v2    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 160
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v2    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    :cond_1
    :try_start_1
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    invoke-direct {v0, p2, p3}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .local v0, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-virtual {v0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;->setMaxSize(J)V

    .line 162
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkHttpDataSize(Lorg/jboss/netty/handler/codec/http/multipart/HttpData;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 164
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;
    :catch_1
    move-exception v1

    .line 165
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public createFileUpload(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    .locals 11
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "filename"    # Ljava/lang/String;
    .param p4, "contentType"    # Ljava/lang/String;
    .param p5, "contentTransferEncoding"    # Ljava/lang/String;
    .param p6, "charset"    # Ljava/nio/charset/Charset;
    .param p7, "size"    # J

    .prologue
    .line 172
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->useDisk:Z

    if-eqz v1, :cond_0

    .line 173
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-wide/from16 v6, p7

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    .line 175
    .local v0, "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setMaxSize(J)V

    .line 176
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkHttpDataSize(Lorg/jboss/netty/handler/codec/http/multipart/HttpData;)V

    .line 177
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;

    move-result-object v10

    .line 178
    .local v10, "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    .end local v0    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    .end local v10    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    :goto_0
    return-object v0

    .line 181
    :cond_0
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkSize:Z

    if-eqz v1, :cond_1

    .line 182
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->minSize:J

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-wide/from16 v6, p7

    invoke-direct/range {v0 .. v9}, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;JJ)V

    .line 184
    .restart local v0    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setMaxSize(J)V

    .line 185
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkHttpDataSize(Lorg/jboss/netty/handler/codec/http/multipart/HttpData;)V

    .line 186
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;

    move-result-object v10

    .line 187
    .restart local v10    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 190
    .end local v0    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    .end local v10    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    :cond_1
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-wide/from16 v6, p7

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    .line 192
    .local v0, "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;->setMaxSize(J)V

    .line 193
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->checkHttpDataSize(Lorg/jboss/netty/handler/codec/http/multipart/HttpData;)V

    goto :goto_0
.end method

.method public removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
    .locals 2
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 198
    instance-of v1, p2, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;

    if-eqz v1, :cond_0

    .line 199
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->getList(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Ljava/util/List;

    move-result-object v0

    .line 200
    .local v0, "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    invoke-interface {v0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 202
    .end local v0    # "fileToDelete":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/HttpData;>;"
    :cond_0
    return-void
.end method

.method public setMaxLimit(J)V
    .locals 1
    .param p1, "max"    # J

    .prologue
    .line 88
    iput-wide p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;->maxSize:J

    .line 89
    return-void
.end method
