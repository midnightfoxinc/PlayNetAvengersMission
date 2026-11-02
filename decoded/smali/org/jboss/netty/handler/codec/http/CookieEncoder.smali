.class public Lorg/jboss/netty/handler/codec/http/CookieEncoder;
.super Ljava/lang/Object;
.source "CookieEncoder.java"


# instance fields
.field private final cookies:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jboss/netty/handler/codec/http/Cookie;",
            ">;"
        }
    .end annotation
.end field

.field private final server:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .param p1, "server"    # Z

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    .line 63
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->server:Z

    .line 64
    return-void
.end method

.method private static add(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
    .locals 1
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # I

    .prologue
    .line 269
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    const/16 v0, 0x3d

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 271
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 272
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 273
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 274
    return-void
.end method

.method private static add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    .line 226
    if-nez p2, :cond_0

    .line 227
    const-string v2, ""

    invoke-static {p0, p1, v2}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->addQuoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    :goto_0
    return-void

    .line 231
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 232
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 233
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 231
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 238
    :sswitch_0
    invoke-static {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->addQuoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 243
    .end local v0    # "c":C
    :cond_1
    invoke-static {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->addUnquoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 233
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0x20 -> :sswitch_0
        0x22 -> :sswitch_0
        0x28 -> :sswitch_0
        0x29 -> :sswitch_0
        0x2c -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x3b -> :sswitch_0
        0x3c -> :sswitch_0
        0x3d -> :sswitch_0
        0x3e -> :sswitch_0
        0x3f -> :sswitch_0
        0x40 -> :sswitch_0
        0x5b -> :sswitch_0
        0x5c -> :sswitch_0
        0x5d -> :sswitch_0
        0x7b -> :sswitch_0
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method private static addQuoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x22

    .line 255
    if-nez p2, :cond_0

    .line 256
    const-string p2, ""

    .line 259
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    const/16 v0, 0x3d

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 261
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 262
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\""

    const-string v2, "\\\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 264
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 265
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 266
    return-void
.end method

.method private static addUnquoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    .line 247
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    const/16 v0, 0x3d

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 249
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 251
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 252
    return-void
.end method

.method private encodeClientSide()Ljava/lang/String;
    .locals 9

    .prologue
    const/16 v8, 0x22

    const/4 v7, 0x1

    .line 185
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    .local v4, "sb":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/Cookie;

    .line 188
    .local v0, "cookie":Lorg/jboss/netty/handler/codec/http/Cookie;
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getVersion()I

    move-result v5

    if-lt v5, v7, :cond_1

    .line 189
    const-string v5, "$Version"

    invoke-static {v4, v5, v7}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 192
    :cond_1
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 195
    const-string v5, "$Path"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    :cond_2
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 199
    const-string v5, "$Domain"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    :cond_3
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getVersion()I

    move-result v5

    if-lt v5, v7, :cond_0

    .line 203
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPorts()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 204
    const/16 v5, 0x24

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 205
    const-string v5, "Port"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 207
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 208
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPorts()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 209
    .local v3, "port":I
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 212
    .end local v3    # "port":I
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5, v8}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 213
    const/16 v5, 0x3b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 214
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 219
    .end local v0    # "cookie":Lorg/jboss/netty/handler/codec/http/Cookie;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_5
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_6

    .line 220
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 222
    :cond_6
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private encodeServerSide()Ljava/lang/String;
    .locals 14

    .prologue
    .line 100
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_0

    .line 101
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "encode() can encode only one cookie on server mode: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    invoke-interface {v7}, Ljava/util/Set;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " cookies added"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 105
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .local v4, "sb":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/Cookie;

    .line 108
    .local v0, "cookie":Lorg/jboss/netty/handler/codec/http/Cookie;
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getMaxAge()I

    move-result v5

    const/high16 v6, -0x80000000

    if-eq v5, v6, :cond_2

    .line 111
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getVersion()I

    move-result v5

    if-nez v5, :cond_9

    .line 112
    const-string v5, "Expires"

    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v6

    new-instance v7, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getMaxAge()I

    move-result v10

    int-to-long v10, v10

    const-wide/16 v12, 0x3e8

    mul-long/2addr v10, v12

    add-long/2addr v8, v10

    invoke-direct {v7, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v7}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->addUnquoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    :cond_2
    :goto_1
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 122
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getVersion()I

    move-result v5

    if-lez v5, :cond_a

    .line 123
    const-string v5, "Path"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :cond_3
    :goto_2
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 130
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getVersion()I

    move-result v5

    if-lez v5, :cond_b

    .line 131
    const-string v5, "Domain"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    :cond_4
    :goto_3
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->isSecure()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 137
    const-string v5, "Secure"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    const/16 v5, 0x3b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 141
    :cond_5
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->isHttpOnly()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 142
    const-string v5, "HTTPOnly"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    const/16 v5, 0x3b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 144
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    :cond_6
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getVersion()I

    move-result v5

    const/4 v6, 0x1

    if-lt v5, v6, :cond_1

    .line 147
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getComment()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_7

    .line 148
    const-string v5, "Comment"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getComment()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    :cond_7
    const-string v5, "Version"

    const/4 v6, 0x1

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 153
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getCommentUrl()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_8

    .line 154
    const-string v5, "CommentURL"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getCommentUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->addQuoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    :cond_8
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPorts()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_d

    .line 158
    const-string v5, "Port"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 160
    const/16 v5, 0x22

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 161
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPorts()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 162
    .local v3, "port":I
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 117
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "port":I
    :cond_9
    const-string v5, "Max-Age"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getMaxAge()I

    move-result v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->add(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 125
    :cond_a
    const-string v5, "Path"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->addUnquoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 133
    :cond_b
    const-string v5, "Domain"

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->addUnquoted(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 165
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_c
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    const/16 v6, 0x22

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 166
    const/16 v5, 0x3b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 167
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 169
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_d
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->isDiscard()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 170
    const-string v5, "Discard"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    const/16 v5, 0x3b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 172
    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 177
    .end local v0    # "cookie":Lorg/jboss/netty/handler/codec/http/Cookie;
    :cond_e
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_f

    .line 178
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 181
    :cond_f
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public addCookie(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultCookie;

    invoke-direct {v1, p1, p2}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 72
    return-void
.end method

.method public addCookie(Lorg/jboss/netty/handler/codec/http/Cookie;)V
    .locals 1
    .param p1, "cookie"    # Lorg/jboss/netty/handler/codec/http/Cookie;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 79
    return-void
.end method

.method public encode()Ljava/lang/String;
    .locals 2

    .prologue
    .line 90
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->server:Z

    if-eqz v1, :cond_0

    .line 91
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->encodeServerSide()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "answer":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->cookies:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 96
    return-object v0

    .line 93
    .end local v0    # "answer":Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/CookieEncoder;->encodeClientSide()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "answer":Ljava/lang/String;
    goto :goto_0
.end method
