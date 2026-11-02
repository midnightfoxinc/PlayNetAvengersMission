.class public Lcom/disney/emagine/sdk/json/EMTJson;
.super Ljava/lang/Object;
.source "EMTJson.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arrayListFromByteArray([B)Ljava/util/ArrayList;
    .locals 2
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, "jsonString":Ljava/lang/String;
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->arrayListFromJsonString(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    return-object v1
.end method

.method public static arrayListFromJsonString(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 170
    new-instance v4, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v4}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 171
    .local v4, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    const/4 v1, 0x0

    .line 175
    .local v1, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :try_start_0
    new-instance v3, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v3, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 177
    .local v3, "jsonString":Ljava/lang/String;
    new-instance v5, Lcom/disney/emagine/sdk/json/EMTJson$2;

    invoke-direct {v5}, Lcom/disney/emagine/sdk/json/EMTJson$2;-><init>()V

    invoke-virtual {v4, v3, v5}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readValue(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/util/ArrayList;

    move-object v1, v0
    :try_end_0
    .catch Lcom/fasterxml/jackson/databind/JsonMappingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/fasterxml/jackson/core/JsonParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 192
    .end local v3    # "jsonString":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 179
    :catch_0
    move-exception v2

    .line 181
    .local v2, "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/JsonMappingException;->printStackTrace()V

    goto :goto_0

    .line 183
    .end local v2    # "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    :catch_1
    move-exception v2

    .line 185
    .local v2, "e":Lcom/fasterxml/jackson/core/JsonParseException;
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParseException;->printStackTrace()V

    goto :goto_0

    .line 187
    .end local v2    # "e":Lcom/fasterxml/jackson/core/JsonParseException;
    :catch_2
    move-exception v2

    .line 189
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static arrayListHashFromJsonString(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 204
    new-instance v4, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v4}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 205
    .local v4, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    const/4 v1, 0x0

    .line 209
    .local v1, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :try_start_0
    new-instance v3, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v3, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 211
    .local v3, "jsonString":Ljava/lang/String;
    new-instance v5, Lcom/disney/emagine/sdk/json/EMTJson$3;

    invoke-direct {v5}, Lcom/disney/emagine/sdk/json/EMTJson$3;-><init>()V

    invoke-virtual {v4, v3, v5}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readValue(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/util/ArrayList;

    move-object v1, v0
    :try_end_0
    .catch Lcom/fasterxml/jackson/databind/JsonMappingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/fasterxml/jackson/core/JsonParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 226
    .end local v3    # "jsonString":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 213
    :catch_0
    move-exception v2

    .line 215
    .local v2, "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/JsonMappingException;->printStackTrace()V

    goto :goto_0

    .line 217
    .end local v2    # "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    :catch_1
    move-exception v2

    .line 219
    .local v2, "e":Lcom/fasterxml/jackson/core/JsonParseException;
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonParseException;->printStackTrace()V

    goto :goto_0

    .line 221
    .end local v2    # "e":Lcom/fasterxml/jackson/core/JsonParseException;
    :catch_2
    move-exception v2

    .line 223
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static bytesFromJavaObject(Ljava/lang/Object;)[B
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 131
    invoke-static {p0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public static hashMapFromByteArray([B)Ljava/util/HashMap;
    .locals 2
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 163
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v0

    .line 165
    .local v0, "jsonString":Ljava/lang/String;
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    return-object v1
.end method

.method public static hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 7
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    new-instance v4, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v4}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 137
    .local v4, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    const/4 v2, 0x0

    .line 141
    .local v2, "hashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    new-instance v3, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v3, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 143
    .local v3, "jsonString":Ljava/lang/String;
    new-instance v5, Lcom/disney/emagine/sdk/json/EMTJson$1;

    invoke-direct {v5}, Lcom/disney/emagine/sdk/json/EMTJson$1;-><init>()V

    invoke-virtual {v4, v3, v5}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readValue(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/util/HashMap;

    move-object v2, v0
    :try_end_0
    .catch Lcom/fasterxml/jackson/databind/JsonMappingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/fasterxml/jackson/core/JsonParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 158
    .end local v3    # "jsonString":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 145
    :catch_0
    move-exception v1

    .line 147
    .local v1, "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/JsonMappingException;->printStackTrace()V

    goto :goto_0

    .line 149
    .end local v1    # "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    :catch_1
    move-exception v1

    .line 151
    .local v1, "e":Lcom/fasterxml/jackson/core/JsonParseException;
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonParseException;->printStackTrace()V

    goto :goto_0

    .line 153
    .end local v1    # "e":Lcom/fasterxml/jackson/core/JsonParseException;
    :catch_2
    move-exception v1

    .line 155
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static isValidObject(Ljava/lang/String;)Z
    .locals 3
    .param p0, "jsonObject"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v1, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 33
    .local v1, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    sget-object v2, Lcom/fasterxml/jackson/databind/DeserializationFeature;->FAIL_ON_READING_DUP_TREE_KEY:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/ObjectMapper;->enable(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 37
    :try_start_0
    invoke-virtual {v1, p0}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readTree(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 39
    const/4 v2, 0x1

    .line 50
    :goto_0
    return v2

    .line 41
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonProcessingException;->printStackTrace()V

    .line 50
    .end local v0    # "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 45
    :catch_1
    move-exception v0

    .line 47
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public static javaObjectFromJsonString(Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p0, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 79
    new-instance v3, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v3}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 80
    .local v3, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    const/4 v1, 0x0

    .line 84
    .local v1, "object":Ljava/lang/Object;
    if-eqz p0, :cond_0

    :try_start_0
    const-string v4, "{}"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 86
    :cond_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/fasterxml/jackson/databind/JsonMappingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 88
    .end local v1    # "object":Ljava/lang/Object;
    .local v2, "object":Ljava/util/HashMap;
    :goto_0
    if-eqz p0, :cond_1

    :try_start_1
    const-string v4, "[]"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 90
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .end local v2    # "object":Ljava/util/HashMap;
    :goto_1
    return-object v1

    .line 92
    .restart local v2    # "object":Ljava/util/HashMap;
    :cond_2
    const-string v4, "{"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 94
    invoke-static {p0}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    .end local v2    # "object":Ljava/util/HashMap;
    .local v1, "object":Ljava/util/HashMap;
    goto :goto_1

    .line 96
    .end local v1    # "object":Ljava/util/HashMap;
    .restart local v2    # "object":Ljava/util/HashMap;
    :cond_3
    const-string v4, "[{"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 98
    invoke-static {p0}, Lcom/disney/emagine/sdk/json/EMTJson;->arrayListHashFromJsonString(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .local v1, "object":Ljava/util/ArrayList;
    goto :goto_1

    .line 100
    .end local v1    # "object":Ljava/util/ArrayList;
    :cond_4
    const-string v4, "["

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 102
    invoke-static {p0}, Lcom/disney/emagine/sdk/json/EMTJson;->arrayListFromJsonString(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .restart local v1    # "object":Ljava/util/ArrayList;
    goto :goto_1

    .line 108
    .end local v1    # "object":Ljava/util/ArrayList;
    :cond_5
    sget-object v4, Lcom/fasterxml/jackson/databind/ObjectMapper$DefaultTyping;->JAVA_LANG_OBJECT:Lcom/fasterxml/jackson/databind/ObjectMapper$DefaultTyping;

    const-string v5, "class"

    invoke-virtual {v3, v4, v5}, Lcom/fasterxml/jackson/databind/ObjectMapper;->enableDefaultTypingAsProperty(Lcom/fasterxml/jackson/databind/ObjectMapper$DefaultTyping;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 110
    const-class v4, Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Lcom/fasterxml/jackson/databind/ObjectMapper;->readValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_1
    .catch Lcom/fasterxml/jackson/core/JsonParseException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Lcom/fasterxml/jackson/databind/JsonMappingException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v1

    .local v1, "object":Ljava/lang/Object;
    goto :goto_1

    .line 113
    .end local v2    # "object":Ljava/util/HashMap;
    :catch_0
    move-exception v0

    .line 115
    .end local v1    # "object":Ljava/lang/Object;
    .local v0, "e":Lcom/fasterxml/jackson/core/JsonParseException;
    :goto_2
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParseException;->printStackTrace()V

    goto :goto_1

    .line 117
    .end local v0    # "e":Lcom/fasterxml/jackson/core/JsonParseException;
    .restart local v1    # "object":Ljava/lang/Object;
    :catch_1
    move-exception v0

    .line 119
    .end local v1    # "object":Ljava/lang/Object;
    .local v0, "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    :goto_3
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/JsonMappingException;->printStackTrace()V

    goto :goto_1

    .line 121
    .end local v0    # "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    .restart local v1    # "object":Ljava/lang/Object;
    :catch_2
    move-exception v0

    .line 123
    .end local v1    # "object":Ljava/lang/Object;
    .local v0, "e":Ljava/io/IOException;
    :goto_4
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 121
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "object":Ljava/util/HashMap;
    :catch_3
    move-exception v0

    move-object v1, v2

    goto :goto_4

    .line 117
    :catch_4
    move-exception v0

    move-object v1, v2

    goto :goto_3

    .line 113
    :catch_5
    move-exception v0

    move-object v1, v2

    goto :goto_2

    .end local v2    # "object":Ljava/util/HashMap;
    .restart local v1    # "object":Ljava/lang/Object;
    :cond_6
    move-object v2, v1

    .restart local v2    # "object":Ljava/util/HashMap;
    goto :goto_0
.end method

.method public static jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 55
    new-instance v2, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v2}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 56
    .local v2, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 57
    .local v3, "out":Ljava/io/OutputStream;
    const/4 v1, 0x0

    .line 61
    .local v1, "jsonString":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v2, v3, p0}, Lcom/fasterxml/jackson/databind/ObjectMapper;->writeValue(Ljava/io/OutputStream;Ljava/lang/Object;)V

    .line 63
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 74
    :goto_0
    return-object v1

    .line 65
    :catch_0
    move-exception v0

    .line 67
    .local v0, "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonProcessingException;->printStackTrace()V

    goto :goto_0

    .line 69
    .end local v0    # "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    :catch_1
    move-exception v0

    .line 71
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
