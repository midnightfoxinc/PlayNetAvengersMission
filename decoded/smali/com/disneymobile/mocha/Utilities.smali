.class public Lcom/disneymobile/mocha/Utilities;
.super Ljava/lang/Object;
.source "Utilities.java"


# static fields
.field public static final PropertyListFormat_BinaryFormat_v1_0:I = 0x2

.field public static final PropertyListFormat_OpenStepFormat:I = 0x0

.field public static final PropertyListFormat_XMLFormat_v1_0:I = 0x1

.field public static final PropertyListReadOptions:I

.field public static final PropertyListWriteOptions:I

.field public static final UTF8:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static JSONStringFromArray([Ljava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p0, "a"    # [Ljava/lang/Object;

    .prologue
    .line 45
    if-nez p0, :cond_0

    const-string v6, "{}"

    .line 71
    :goto_0
    return-object v6

    .line 48
    :cond_0
    array-length v6, p0

    if-nez v6, :cond_1

    const-string v6, "{}"

    goto :goto_0

    .line 51
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "{ "

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .local v3, "returnString":Ljava/lang/StringBuilder;
    array-length v2, p0

    .line 53
    .local v2, "len":I
    const/4 v4, 0x0

    .line 54
    .local v4, "val":Ljava/lang/Object;
    const/4 v1, 0x0

    .end local v4    # "val":Ljava/lang/Object;
    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_5

    .line 55
    aget-object v4, p0, v1

    .line 56
    .restart local v4    # "val":Ljava/lang/Object;
    invoke-static {v4}, Lcom/disneymobile/mocha/NSObject;->JSONStringFromValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 58
    .local v5, "valString":Ljava/lang/String;
    const-string v0, ""

    .line 59
    .local v0, "comma":Ljava/lang/String;
    add-int/lit8 v6, v2, -0x1

    if-ge v1, v6, :cond_4

    const/4 v6, 0x1

    if-le v2, v6, :cond_4

    .line 60
    const-string v0, ", "

    .line 65
    :cond_2
    :goto_2
    if-eqz v5, :cond_3

    .line 66
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 61
    :cond_4
    add-int/lit8 v6, v2, -0x1

    if-eq v1, v6, :cond_2

    .line 62
    const-string v0, " "

    goto :goto_2

    .line 70
    .end local v0    # "comma":Ljava/lang/String;
    .end local v4    # "val":Ljava/lang/Object;
    .end local v5    # "valString":Ljava/lang/String;
    :cond_5
    const-string v6, " }"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method

.method public static JSONStringFromDictionary(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "d":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p0, :cond_0

    const-string v8, ""

    .line 98
    :goto_0
    return-object v8

    .line 77
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, "{ "

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .local v5, "returnString":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    move-result v4

    .line 79
    .local v4, "keyCount":I
    const/4 v1, 0x0

    .line 80
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 82
    .local v3, "key":Ljava/lang/String;
    const-string v8, "\""

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    const-string v8, "\" : "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-virtual {p0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 87
    .local v6, "val":Ljava/lang/Object;
    invoke-static {v6}, Lcom/disneymobile/mocha/NSObject;->JSONStringFromValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 90
    .local v7, "valString":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 91
    if-eq v1, v4, :cond_2

    const/4 v8, 0x1

    if-le v4, v8, :cond_2

    const-string v0, ", "

    .line 92
    .local v0, "comma":Ljava/lang/String;
    :goto_2
    if-eqz v7, :cond_1

    .line 93
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 91
    .end local v0    # "comma":Ljava/lang/String;
    :cond_2
    const-string v0, " "

    goto :goto_2

    .line 97
    .end local v3    # "key":Ljava/lang/String;
    .end local v6    # "val":Ljava/lang/Object;
    .end local v7    # "valString":Ljava/lang/String;
    :cond_3
    const-string v8, " }"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method public static MD5HashBytes(Ljava/lang/String;)[B
    .locals 4
    .param p0, "_this"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 209
    :try_start_0
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 215
    :goto_0
    return-object v1

    .line 210
    :catch_0
    move-exception v0

    .line 211
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v2, "NSString"

    const-string v3, "MD5 is not available"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 213
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 214
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v2, "NSString"

    const-string v3, "Unsupported encoding UTF-8"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static arrayFromJSON(Lorg/json/JSONArray;)[Ljava/lang/Object;
    .locals 5
    .param p0, "jsonArray"    # Lorg/json/JSONArray;

    .prologue
    .line 103
    :try_start_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v4

    new-array v0, v4, [Ljava/lang/Object;

    .line 104
    .local v0, "array":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 105
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 106
    .local v3, "value":Ljava/lang/Object;
    instance-of v4, v3, Lorg/json/JSONObject;

    if-eqz v4, :cond_1

    .line 107
    check-cast v3, Lorg/json/JSONObject;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-static {v3}, Lcom/disneymobile/mocha/Utilities;->dictionaryFromJSON(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v3

    .line 110
    :cond_0
    :goto_1
    aput-object v3, v0, v2

    .line 104
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v4, v3, Lorg/json/JSONArray;

    if-eqz v4, :cond_0

    .line 109
    check-cast v3, Lorg/json/JSONArray;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-static {v3}, Lcom/disneymobile/mocha/Utilities;->arrayFromJSON(Lorg/json/JSONArray;)[Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .local v3, "value":[Ljava/lang/Object;
    goto :goto_1

    .line 113
    .end local v0    # "array":[Ljava/lang/Object;
    .end local v2    # "i":I
    .end local v3    # "value":[Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 114
    .local v1, "e":Lorg/json/JSONException;
    const/4 v4, 0x0

    new-array v0, v4, [Ljava/lang/Object;

    .end local v1    # "e":Lorg/json/JSONException;
    :cond_2
    return-object v0
.end method

.method public static concatString([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "str"    # [Ljava/lang/String;
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 151
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    .line 152
    .local v1, "val":Ljava/lang/String;
    array-length v2, p0

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 153
    aget-object v2, p0, v4

    .line 158
    :goto_0
    return-object v2

    .line 154
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 155
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 154
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 157
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    .line 158
    goto :goto_0
.end method

.method public static convertStreamToStringWithStringEncoding(Ljava/io/InputStream;Lcom/disneymobile/mocha/NSStringEncoding;)Ljava/lang/String;
    .locals 6
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "stringEncoding"    # Lcom/disneymobile/mocha/NSStringEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    if-eqz p0, :cond_1

    .line 189
    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    .line 191
    .local v4, "writer":Ljava/io/Writer;
    const/16 v5, 0x400

    new-array v0, v5, [C

    .line 193
    .local v0, "buffer":[C
    :try_start_0
    sget-object v5, Lcom/disneymobile/mocha/NSStringEncoding;->UTF8:Lcom/disneymobile/mocha/NSStringEncoding;

    invoke-static {v5}, Lcom/disneymobile/mocha/support/StringUtil;->stringEncodingToString(Lcom/disneymobile/mocha/NSStringEncoding;)Ljava/lang/String;

    move-result-object v3

    .line 194
    .local v3, "stringEncodingValue":Ljava/lang/String;
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, p0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 196
    .local v2, "reader":Ljava/io/Reader;
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .local v1, "n":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_0

    .line 197
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v1}, Ljava/io/Writer;->write([CII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 199
    .end local v1    # "n":I
    .end local v2    # "reader":Ljava/io/Reader;
    .end local v3    # "stringEncodingValue":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 202
    :cond_0
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 204
    .end local v0    # "buffer":[C
    .end local v4    # "writer":Ljava/io/Writer;
    :goto_1
    return-object v5

    :cond_1
    const-string v5, ""

    goto :goto_1
.end method

.method public static dataUsingEncoding(Ljava/lang/String;I)Lcom/disneymobile/mocha/NSData;
    .locals 4
    .param p0, "_this"    # Ljava/lang/String;
    .param p1, "encoding"    # I

    .prologue
    .line 170
    packed-switch p1, :pswitch_data_0

    .line 174
    :try_start_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not supported."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    :catch_0
    move-exception v0

    .line 177
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was not convertible to."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 172
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :pswitch_0
    :try_start_1
    const-string v1, "UTF-8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/disneymobile/mocha/NSData;->dataWithBytesNoCopy([B)Lcom/disneymobile/mocha/NSData;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    return-object v1

    .line 170
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public static dictionaryFromJSON(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 5
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 121
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 122
    .local v0, "dictionary":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 123
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 124
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 125
    .local v3, "value":Ljava/lang/Object;
    instance-of v4, v3, Lorg/json/JSONObject;

    if-eqz v4, :cond_2

    .line 126
    check-cast v3, Lorg/json/JSONObject;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-static {v3}, Lcom/disneymobile/mocha/Utilities;->dictionaryFromJSON(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v3

    .line 129
    :cond_0
    :goto_1
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 132
    .end local v0    # "dictionary":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "key":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 133
    .local v1, "e":Lorg/json/JSONException;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    return-object v0

    .line 127
    .restart local v0    # "dictionary":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_2
    :try_start_1
    instance-of v4, v3, Lorg/json/JSONArray;

    if-eqz v4, :cond_0

    .line 128
    check-cast v3, Lorg/json/JSONArray;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-static {v3}, Lcom/disneymobile/mocha/Utilities;->arrayFromJSON(Lorg/json/JSONArray;)[Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .local v3, "value":[Ljava/lang/Object;
    goto :goto_1
.end method

.method public static sortedArrayUsingSelector(Ljava/util/Set;Lcom/disneymobile/mocha/support/Selector;)[Ljava/lang/String;
    .locals 4
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/disneymobile/mocha/support/Selector;",
            ")[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "contents":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 138
    .local v0, "copy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Lcom/disneymobile/mocha/Utilities$1;

    invoke-direct {v3, p1}, Lcom/disneymobile/mocha/Utilities$1;-><init>(Lcom/disneymobile/mocha/support/Selector;)V

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 144
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v2, v3, [Ljava/lang/String;

    .line 145
    .local v2, "retVal":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 146
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    aput-object v3, v2, v1

    .line 145
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    :cond_0
    return-object v2
.end method

.method public static varargs stringWithFormat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p0, "format"    # Ljava/lang/String;
    .param p1, "values"    # [Ljava/lang/Object;

    .prologue
    .line 162
    move-object v3, p0

    .line 163
    .local v3, "result":Ljava/lang/String;
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 164
    .local v4, "value":Ljava/lang/Object;
    const-string v5, "%@"

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 163
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 166
    .end local v4    # "value":Ljava/lang/Object;
    :cond_0
    return-object v3
.end method
