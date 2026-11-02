.class public Lorg/jboss/netty/handler/codec/http/CookieDecoder;
.super Ljava/lang/Object;
.source "CookieDecoder.java"


# static fields
.field private static final COMMA:C = ','


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method private static extractKeyValuePairs(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 15
    .param p0, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 179
    .local p1, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 180
    .local v3, "headerLen":I
    const/4 v4, 0x0

    .line 184
    .local v4, "i":I
    :goto_0
    if-ne v4, v3, :cond_1

    .line 298
    :cond_0
    return-void

    .line 187
    :cond_1
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v13

    sparse-switch v13, :sswitch_data_0

    .line 198
    :goto_1
    if-eq v4, v3, :cond_0

    .line 201
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x24

    if-ne v13, v14, :cond_2

    .line 202
    add-int/lit8 v4, v4, 0x1

    .line 203
    goto :goto_1

    .line 190
    :sswitch_0
    add-int/lit8 v4, v4, 0x1

    .line 191
    goto :goto_0

    .line 211
    :cond_2
    if-ne v4, v3, :cond_3

    .line 212
    const/4 v6, 0x0

    .line 213
    .local v6, "name":Ljava/lang/String;
    const/4 v12, 0x0

    .line 295
    .local v12, "value":Ljava/lang/String;
    :goto_2
    move-object/from16 v0, p1

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 215
    .end local v6    # "name":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/String;
    :cond_3
    move v7, v4

    .line 217
    .local v7, "newNameStart":I
    :cond_4
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v13

    packed-switch v13, :pswitch_data_0

    .line 283
    :pswitch_0
    add-int/lit8 v4, v4, 0x1

    .line 286
    if-ne v4, v3, :cond_4

    .line 288
    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 289
    .restart local v6    # "name":Ljava/lang/String;
    const/4 v12, 0x0

    .line 290
    .restart local v12    # "value":Ljava/lang/String;
    goto :goto_2

    .line 220
    .end local v6    # "name":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/String;
    :pswitch_1
    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 221
    .restart local v6    # "name":Ljava/lang/String;
    const/4 v12, 0x0

    .line 222
    .restart local v12    # "value":Ljava/lang/String;
    goto :goto_2

    .line 225
    .end local v6    # "name":Ljava/lang/String;
    .end local v12    # "value":Ljava/lang/String;
    :pswitch_2
    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 226
    .restart local v6    # "name":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    .line 227
    if-ne v4, v3, :cond_5

    .line 229
    const-string v12, ""

    .line 230
    .restart local v12    # "value":Ljava/lang/String;
    goto :goto_2

    .line 233
    .end local v12    # "value":Ljava/lang/String;
    :cond_5
    move v9, v4

    .line 234
    .local v9, "newValueStart":I
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 235
    .local v1, "c":C
    const/16 v13, 0x22

    if-eq v1, v13, :cond_6

    const/16 v13, 0x27

    if-ne v1, v13, :cond_a

    .line 237
    :cond_6
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v13

    sub-int/2addr v13, v4

    invoke-direct {v8, v13}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 238
    .local v8, "newValueBuf":Ljava/lang/StringBuilder;
    move v10, v1

    .line 239
    .local v10, "q":C
    const/4 v2, 0x0

    .line 240
    .local v2, "hadBackslash":Z
    add-int/lit8 v4, v4, 0x1

    move v5, v4

    .line 242
    .end local v4    # "i":I
    .local v5, "i":I
    :goto_3
    if-ne v5, v3, :cond_7

    .line 243
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .restart local v12    # "value":Ljava/lang/String;
    move v4, v5

    .line 244
    .end local v5    # "i":I
    .restart local v4    # "i":I
    goto :goto_2

    .line 246
    .end local v4    # "i":I
    .end local v12    # "value":Ljava/lang/String;
    .restart local v5    # "i":I
    :cond_7
    if-eqz v2, :cond_8

    .line 247
    const/4 v2, 0x0

    .line 248
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 249
    sparse-switch v1, :sswitch_data_1

    .line 256
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v5, v4

    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_3

    .line 252
    .end local v5    # "i":I
    .restart local v4    # "i":I
    :sswitch_1
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v8, v13, v1}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    move v5, v4

    .line 253
    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_3

    .line 259
    :cond_8
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 260
    if-ne v1, v10, :cond_9

    .line 261
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 262
    .restart local v12    # "value":Ljava/lang/String;
    goto :goto_2

    .line 264
    .end local v12    # "value":Ljava/lang/String;
    :cond_9
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 265
    const/16 v13, 0x5c

    if-ne v1, v13, :cond_c

    .line 266
    const/4 v2, 0x1

    move v5, v4

    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_3

    .line 272
    .end local v2    # "hadBackslash":Z
    .end local v5    # "i":I
    .end local v8    # "newValueBuf":Ljava/lang/StringBuilder;
    .end local v10    # "q":C
    .restart local v4    # "i":I
    :cond_a
    const/16 v13, 0x3b

    invoke-virtual {p0, v13, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v11

    .line 273
    .local v11, "semiPos":I
    if-lez v11, :cond_b

    .line 274
    invoke-virtual {p0, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 275
    .restart local v12    # "value":Ljava/lang/String;
    move v4, v11

    goto/16 :goto_2

    .line 277
    .end local v12    # "value":Ljava/lang/String;
    :cond_b
    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    .line 278
    .restart local v12    # "value":Ljava/lang/String;
    move v4, v3

    goto/16 :goto_2

    .end local v11    # "semiPos":I
    .end local v12    # "value":Ljava/lang/String;
    .restart local v2    # "hadBackslash":Z
    .restart local v8    # "newValueBuf":Ljava/lang/StringBuilder;
    .restart local v10    # "q":C
    :cond_c
    move v5, v4

    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_3

    .line 187
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x2c -> :sswitch_0
        0x3b -> :sswitch_0
    .end sparse-switch

    .line 217
    :pswitch_data_0
    .packed-switch 0x3b
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 249
    :sswitch_data_1
    .sparse-switch
        0x22 -> :sswitch_1
        0x27 -> :sswitch_1
        0x5c -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method public decode(Ljava/lang/String;)Ljava/util/Set;
    .locals 36
    .param p1, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lorg/jboss/netty/handler/codec/http/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    new-instance v20, Ljava/util/ArrayList;

    const/16 v29, 0x8

    move-object/from16 v0, v20

    move/from16 v1, v29

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 59
    .local v20, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v27, Ljava/util/ArrayList;

    const/16 v29, 0x8

    move-object/from16 v0, v27

    move/from16 v1, v29

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 60
    .local v27, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/CookieDecoder;->extractKeyValuePairs(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 62
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->isEmpty()Z

    move-result v29

    if-eqz v29, :cond_1

    .line 63
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v8

    .line 173
    :cond_0
    :goto_0
    return-object v8

    .line 67
    :cond_1
    const/16 v28, 0x0

    .line 71
    .local v28, "version":I
    const/16 v29, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    const-string v30, "Version"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_2

    .line 73
    const/16 v29, 0x0

    :try_start_0
    move-object/from16 v0, v27

    move/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v28

    .line 77
    :goto_1
    const/4 v12, 0x1

    .line 82
    .local v12, "i":I
    :goto_2
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v29

    move/from16 v0, v29

    if-gt v0, v12, :cond_3

    .line 84
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v8

    goto :goto_0

    .line 79
    .end local v12    # "i":I
    :cond_2
    const/4 v12, 0x0

    .restart local v12    # "i":I
    goto :goto_2

    .line 87
    :cond_3
    new-instance v8, Ljava/util/TreeSet;

    invoke-direct {v8}, Ljava/util/TreeSet;-><init>()V

    .line 88
    .local v8, "cookies":Ljava/util/Set;, "Ljava/util/Set<Lorg/jboss/netty/handler/codec/http/Cookie;>;"
    :goto_3
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v29

    move/from16 v0, v29

    if-ge v12, v0, :cond_0

    .line 89
    move-object/from16 v0, v20

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 90
    .local v17, "name":Ljava/lang/String;
    move-object/from16 v0, v27

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/String;

    .line 91
    .local v26, "value":Ljava/lang/String;
    if-nez v26, :cond_4

    .line 92
    const-string v26, ""

    .line 95
    :cond_4
    new-instance v5, Lorg/jboss/netty/handler/codec/http/DefaultCookie;

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-direct {v5, v0, v1}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .local v5, "c":Lorg/jboss/netty/handler/codec/http/Cookie;
    const/4 v9, 0x0

    .line 98
    .local v9, "discard":Z
    const/16 v25, 0x0

    .line 99
    .local v25, "secure":Z
    const/4 v11, 0x0

    .line 100
    .local v11, "httpOnly":Z
    const/4 v6, 0x0

    .line 101
    .local v6, "comment":Ljava/lang/String;
    const/4 v7, 0x0

    .line 102
    .local v7, "commentURL":Ljava/lang/String;
    const/4 v10, 0x0

    .line 103
    .local v10, "domain":Ljava/lang/String;
    const/16 v21, 0x0

    .line 104
    .local v21, "path":Ljava/lang/String;
    const/high16 v16, -0x80000000

    .line 105
    .local v16, "maxAge":I
    new-instance v23, Ljava/util/ArrayList;

    const/16 v29, 0x2

    move-object/from16 v0, v23

    move/from16 v1, v29

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 107
    .local v23, "ports":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    add-int/lit8 v14, v12, 0x1

    .local v14, "j":I
    :goto_4
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v29

    move/from16 v0, v29

    if-ge v14, v0, :cond_11

    .line 108
    move-object/from16 v0, v20

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    .end local v17    # "name":Ljava/lang/String;
    check-cast v17, Ljava/lang/String;

    .line 109
    .restart local v17    # "name":Ljava/lang/String;
    move-object/from16 v0, v27

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    .end local v26    # "value":Ljava/lang/String;
    check-cast v26, Ljava/lang/String;

    .line 111
    .restart local v26    # "value":Ljava/lang/String;
    const-string v29, "Discard"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_6

    .line 112
    const/4 v9, 0x1

    .line 107
    :cond_5
    :goto_5
    add-int/lit8 v14, v14, 0x1

    add-int/lit8 v12, v12, 0x1

    goto :goto_4

    .line 113
    :cond_6
    const-string v29, "Secure"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_7

    .line 114
    const/16 v25, 0x1

    goto :goto_5

    .line 115
    :cond_7
    const-string v29, "HTTPOnly"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_8

    .line 116
    const/4 v11, 0x1

    goto :goto_5

    .line 117
    :cond_8
    const-string v29, "Comment"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_9

    .line 118
    move-object/from16 v6, v26

    goto :goto_5

    .line 119
    :cond_9
    const-string v29, "CommentURL"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_a

    .line 120
    move-object/from16 v7, v26

    goto :goto_5

    .line 121
    :cond_a
    const-string v29, "Domain"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_b

    .line 122
    move-object/from16 v10, v26

    goto :goto_5

    .line 123
    :cond_b
    const-string v29, "Path"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_c

    .line 124
    move-object/from16 v21, v26

    goto :goto_5

    .line 125
    :cond_c
    const-string v29, "Expires"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_e

    .line 127
    :try_start_1
    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/util/Date;->getTime()J

    move-result-wide v30

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    sub-long v18, v30, v32

    .line 131
    .local v18, "maxAgeMillis":J
    const-wide/16 v30, 0x3e8

    div-long v30, v18, v30

    move-wide/from16 v0, v30

    long-to-int v0, v0

    move/from16 v30, v0

    const-wide/16 v32, 0x3e8

    rem-long v32, v18, v32
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    const-wide/16 v34, 0x0

    cmp-long v29, v32, v34

    if-eqz v29, :cond_d

    const/16 v29, 0x1

    :goto_6
    add-int v16, v30, v29

    goto/16 :goto_5

    :cond_d
    const/16 v29, 0x0

    goto :goto_6

    .line 137
    .end local v18    # "maxAgeMillis":J
    :cond_e
    const-string v29, "Max-Age"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_f

    .line 138
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    goto/16 :goto_5

    .line 139
    :cond_f
    const-string v29, "Version"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_10

    .line 140
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v28

    goto/16 :goto_5

    .line 141
    :cond_10
    const-string v29, "Port"

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_11

    .line 142
    const/16 v29, 0x2c

    move-object/from16 v0, v26

    move/from16 v1, v29

    invoke-static {v0, v1}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v22

    .line 143
    .local v22, "portList":[Ljava/lang/String;
    move-object/from16 v4, v22

    .local v4, "arr$":[Ljava/lang/String;
    array-length v15, v4

    .local v15, "len$":I
    const/4 v13, 0x0

    .local v13, "i$":I
    :goto_7
    if-ge v13, v15, :cond_5

    aget-object v24, v4, v13

    .line 145
    .local v24, "s1":Ljava/lang/String;
    :try_start_2
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, v23

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 143
    :goto_8
    add-int/lit8 v13, v13, 0x1

    goto :goto_7

    .line 155
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v13    # "i$":I
    .end local v15    # "len$":I
    .end local v22    # "portList":[Ljava/lang/String;
    .end local v24    # "s1":Ljava/lang/String;
    :cond_11
    move/from16 v0, v28

    invoke-interface {v5, v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->setVersion(I)V

    .line 156
    move/from16 v0, v16

    invoke-interface {v5, v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->setMaxAge(I)V

    .line 157
    move-object/from16 v0, v21

    invoke-interface {v5, v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->setPath(Ljava/lang/String;)V

    .line 158
    invoke-interface {v5, v10}, Lorg/jboss/netty/handler/codec/http/Cookie;->setDomain(Ljava/lang/String;)V

    .line 159
    move/from16 v0, v25

    invoke-interface {v5, v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->setSecure(Z)V

    .line 160
    invoke-interface {v5, v11}, Lorg/jboss/netty/handler/codec/http/Cookie;->setHttpOnly(Z)V

    .line 161
    if-lez v28, :cond_12

    .line 162
    invoke-interface {v5, v6}, Lorg/jboss/netty/handler/codec/http/Cookie;->setComment(Ljava/lang/String;)V

    .line 164
    :cond_12
    const/16 v29, 0x1

    move/from16 v0, v28

    move/from16 v1, v29

    if-le v0, v1, :cond_13

    .line 165
    invoke-interface {v5, v7}, Lorg/jboss/netty/handler/codec/http/Cookie;->setCommentUrl(Ljava/lang/String;)V

    .line 166
    move-object/from16 v0, v23

    invoke-interface {v5, v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->setPorts(Ljava/lang/Iterable;)V

    .line 167
    invoke-interface {v5, v9}, Lorg/jboss/netty/handler/codec/http/Cookie;->setDiscard(Z)V

    .line 170
    :cond_13
    invoke-interface {v8, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 88
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_3

    .line 146
    .restart local v4    # "arr$":[Ljava/lang/String;
    .restart local v13    # "i$":I
    .restart local v15    # "len$":I
    .restart local v22    # "portList":[Ljava/lang/String;
    .restart local v24    # "s1":Ljava/lang/String;
    :catch_0
    move-exception v29

    goto :goto_8

    .line 134
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v13    # "i$":I
    .end local v15    # "len$":I
    .end local v22    # "portList":[Ljava/lang/String;
    .end local v24    # "s1":Ljava/lang/String;
    :catch_1
    move-exception v29

    goto/16 :goto_5

    .line 74
    .end local v5    # "c":Lorg/jboss/netty/handler/codec/http/Cookie;
    .end local v6    # "comment":Ljava/lang/String;
    .end local v7    # "commentURL":Ljava/lang/String;
    .end local v8    # "cookies":Ljava/util/Set;, "Ljava/util/Set<Lorg/jboss/netty/handler/codec/http/Cookie;>;"
    .end local v9    # "discard":Z
    .end local v10    # "domain":Ljava/lang/String;
    .end local v11    # "httpOnly":Z
    .end local v12    # "i":I
    .end local v14    # "j":I
    .end local v16    # "maxAge":I
    .end local v17    # "name":Ljava/lang/String;
    .end local v21    # "path":Ljava/lang/String;
    .end local v23    # "ports":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v25    # "secure":Z
    .end local v26    # "value":Ljava/lang/String;
    :catch_2
    move-exception v29

    goto/16 :goto_1
.end method
