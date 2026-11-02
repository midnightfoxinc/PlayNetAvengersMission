.class public Lorg/jboss/netty/handler/codec/http/HttpMethod;
.super Ljava/lang/Object;
.source "HttpMethod.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/jboss/netty/handler/codec/http/HttpMethod;",
        ">;"
    }
.end annotation


# static fields
.field public static final CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final DELETE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final HEAD:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final OPTIONS:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final PATCH:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final POST:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final PUT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field public static final TRACE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

.field private static final methodMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jboss/netty/handler/codec/http/HttpMethod;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 35
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "OPTIONS"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->OPTIONS:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 43
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "GET"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 49
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "HEAD"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->HEAD:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 56
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "POST"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->POST:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 61
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "PUT"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PUT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 67
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "PATCH"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PATCH:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 73
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "DELETE"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->DELETE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 79
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "TRACE"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->TRACE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 85
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    const-string v1, "CONNECT"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    .line 91
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->OPTIONS:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->OPTIONS:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->HEAD:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->HEAD:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->POST:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->POST:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PUT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PUT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PATCH:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PATCH:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->DELETE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->DELETE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->TRACE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->TRACE:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    if-nez p1, :cond_0

    .line 136
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "name"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 139
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 140
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 141
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "empty name"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 144
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 147
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "invalid character in name"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 144
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 151
    :cond_4
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->name:Ljava/lang/String;

    .line 152
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMethod;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 108
    if-nez p0, :cond_0

    .line 109
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "name"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 113
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 114
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "empty name"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    :cond_1
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->methodMap:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 118
    .local v0, "result":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    if-eqz v0, :cond_2

    .line 121
    .end local v0    # "result":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    :goto_0
    return-object v0

    .restart local v0    # "result":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    :cond_2
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .end local v0    # "result":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/codec/http/HttpMethod;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->compareTo(Lorg/jboss/netty/handler/codec/http/HttpMethod;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/HttpMethod;)I
    .locals 2
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .prologue
    .line 182
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 168
    instance-of v1, p1, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-nez v1, :cond_0

    .line 169
    const/4 v1, 0x0

    .line 173
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 172
    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 173
    .local v0, "that":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpMethod;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 163
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
