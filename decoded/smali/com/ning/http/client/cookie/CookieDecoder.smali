.class public Lcom/ning/http/client/cookie/CookieDecoder;
.super Ljava/lang/Object;
.source "CookieDecoder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)Lcom/ning/http/client/cookie/Cookie;
    .locals 21
    .param p0, "header"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_0

    .line 27
    const/4 v4, 0x0

    .line 157
    :goto_0
    return-object v4

    .line 29
    :cond_0
    new-instance v3, Lcom/ning/http/client/cookie/KeyValuePairsParser;

    invoke-direct {v3}, Lcom/ning/http/client/cookie/KeyValuePairsParser;-><init>()V

    .line 31
    .local v3, "pairsParser":Lcom/ning/http/client/cookie/KeyValuePairsParser;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v12

    .line 32
    .local v12, "headerLen":I
    const/4 v13, 0x0

    .line 36
    .local v13, "i":I
    :goto_1
    if-ne v13, v12, :cond_2

    .line 157
    :cond_1
    invoke-virtual {v3}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->cookie()Lcom/ning/http/client/cookie/Cookie;

    move-result-object v4

    goto :goto_0

    .line 39
    :cond_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 40
    .local v9, "c":C
    const/16 v4, 0x2c

    if-eq v9, v4, :cond_1

    .line 45
    const/16 v4, 0x9

    if-eq v9, v4, :cond_3

    const/16 v4, 0xa

    if-eq v9, v4, :cond_3

    const/16 v4, 0xb

    if-eq v9, v4, :cond_3

    const/16 v4, 0xc

    if-eq v9, v4, :cond_3

    const/16 v4, 0xd

    if-eq v9, v4, :cond_3

    const/16 v4, 0x20

    if-eq v9, v4, :cond_3

    const/16 v4, 0x3b

    if-ne v9, v4, :cond_4

    .line 46
    :cond_3
    add-int/lit8 v13, v13, 0x1

    .line 47
    goto :goto_1

    .line 52
    :cond_4
    move v5, v13

    .line 53
    .local v5, "newNameStart":I
    move v6, v13

    .line 57
    .local v6, "newNameEnd":I
    if-ne v13, v12, :cond_5

    .line 58
    const/4 v8, 0x0

    .local v8, "rawValue":Ljava/lang/String;
    move-object v7, v8

    :goto_2
    move-object/from16 v4, p0

    .line 155
    invoke-virtual/range {v3 .. v8}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->parseKeyValuePair(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 62
    .end local v8    # "rawValue":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v10

    .line 63
    .local v10, "curChar":C
    const/16 v4, 0x3b

    if-ne v10, v4, :cond_6

    .line 65
    move v6, v13

    .line 66
    const/4 v8, 0x0

    .restart local v8    # "rawValue":Ljava/lang/String;
    move-object v7, v8

    .line 67
    .local v7, "value":Ljava/lang/Object;
    goto :goto_2

    .line 68
    .end local v7    # "value":Ljava/lang/Object;
    .end local v8    # "rawValue":Ljava/lang/String;
    :cond_6
    const/16 v4, 0x3d

    if-ne v10, v4, :cond_e

    .line 70
    move v6, v13

    .line 71
    add-int/lit8 v13, v13, 0x1

    .line 72
    if-ne v13, v12, :cond_7

    .line 74
    const-string v8, ""

    .restart local v8    # "rawValue":Ljava/lang/String;
    move-object v7, v8

    .line 75
    .local v7, "value":Ljava/lang/String;
    goto :goto_2

    .line 78
    .end local v7    # "value":Ljava/lang/String;
    .end local v8    # "rawValue":Ljava/lang/String;
    :cond_7
    move/from16 v16, v13

    .line 79
    .local v16, "newValueStart":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 80
    const/16 v4, 0x22

    if-eq v9, v4, :cond_8

    const/16 v4, 0x27

    if-ne v9, v4, :cond_c

    .line 82
    :cond_8
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v15

    .line 84
    .local v15, "newValueBuf":Ljava/lang/StringBuilder;
    move/from16 v19, v13

    .line 85
    .local v19, "rawValueStart":I
    move/from16 v18, v13

    .line 87
    .local v18, "rawValueEnd":I
    move/from16 v17, v9

    .line 88
    .local v17, "q":C
    const/4 v11, 0x0

    .line 89
    .local v11, "hadBackslash":Z
    add-int/lit8 v13, v13, 0x1

    move v14, v13

    .line 91
    .end local v13    # "i":I
    .local v14, "i":I
    :goto_3
    if-ne v14, v12, :cond_9

    .line 92
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 95
    .restart local v7    # "value":Ljava/lang/String;
    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "rawValue":Ljava/lang/String;
    move v13, v14

    .line 96
    .end local v14    # "i":I
    .restart local v13    # "i":I
    goto :goto_2

    .line 98
    .end local v7    # "value":Ljava/lang/String;
    .end local v8    # "rawValue":Ljava/lang/String;
    .end local v13    # "i":I
    .restart local v14    # "i":I
    :cond_9
    if-eqz v11, :cond_a

    .line 99
    const/4 v11, 0x0

    .line 100
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "i":I
    .restart local v13    # "i":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 101
    move/from16 v18, v13

    .line 102
    sparse-switch v9, :sswitch_data_0

    .line 111
    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v14, v13

    .end local v13    # "i":I
    .restart local v14    # "i":I
    goto :goto_3

    .line 107
    .end local v14    # "i":I
    .restart local v13    # "i":I
    :sswitch_0
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v15, v4, v9}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    move v14, v13

    .line 108
    .end local v13    # "i":I
    .restart local v14    # "i":I
    goto :goto_3

    .line 114
    :cond_a
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "i":I
    .restart local v13    # "i":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 115
    move/from16 v18, v13

    .line 116
    move/from16 v0, v17

    if-ne v9, v0, :cond_b

    .line 117
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 121
    .restart local v7    # "value":Ljava/lang/String;
    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 122
    .restart local v8    # "rawValue":Ljava/lang/String;
    goto/16 :goto_2

    .line 124
    .end local v7    # "value":Ljava/lang/String;
    .end local v8    # "rawValue":Ljava/lang/String;
    :cond_b
    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 125
    const/16 v4, 0x5c

    if-ne v9, v4, :cond_f

    .line 126
    const/4 v11, 0x1

    move v14, v13

    .end local v13    # "i":I
    .restart local v14    # "i":I
    goto :goto_3

    .line 132
    .end local v11    # "hadBackslash":Z
    .end local v14    # "i":I
    .end local v15    # "newValueBuf":Ljava/lang/StringBuilder;
    .end local v17    # "q":C
    .end local v18    # "rawValueEnd":I
    .end local v19    # "rawValueStart":I
    .restart local v13    # "i":I
    :cond_c
    const/16 v4, 0x3b

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v13}, Ljava/lang/String;->indexOf(II)I

    move-result v20

    .line 133
    .local v20, "semiPos":I
    if-lez v20, :cond_d

    .line 134
    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "rawValue":Ljava/lang/String;
    move-object v7, v8

    .line 135
    .restart local v7    # "value":Ljava/lang/String;
    move/from16 v13, v20

    goto/16 :goto_2

    .line 137
    .end local v7    # "value":Ljava/lang/String;
    .end local v8    # "rawValue":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "rawValue":Ljava/lang/String;
    move-object v7, v8

    .line 138
    .restart local v7    # "value":Ljava/lang/String;
    move v13, v12

    goto/16 :goto_2

    .line 143
    .end local v7    # "value":Ljava/lang/String;
    .end local v8    # "rawValue":Ljava/lang/String;
    .end local v16    # "newValueStart":I
    .end local v20    # "semiPos":I
    :cond_e
    add-int/lit8 v13, v13, 0x1

    .line 146
    if-ne v13, v12, :cond_5

    .line 148
    move v6, v12

    .line 149
    const/4 v8, 0x0

    .restart local v8    # "rawValue":Ljava/lang/String;
    move-object v7, v8

    .line 150
    .local v7, "value":Ljava/lang/Object;
    goto/16 :goto_2

    .end local v7    # "value":Ljava/lang/Object;
    .end local v8    # "rawValue":Ljava/lang/String;
    .restart local v11    # "hadBackslash":Z
    .restart local v15    # "newValueBuf":Ljava/lang/StringBuilder;
    .restart local v16    # "newValueStart":I
    .restart local v17    # "q":C
    .restart local v18    # "rawValueEnd":I
    .restart local v19    # "rawValueStart":I
    :cond_f
    move v14, v13

    .end local v13    # "i":I
    .restart local v14    # "i":I
    goto/16 :goto_3

    .line 102
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_0
        0x27 -> :sswitch_0
        0x5c -> :sswitch_0
    .end sparse-switch
.end method
