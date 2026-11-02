.class public final Lorg/jboss/netty/util/internal/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# static fields
.field private static final EMPTY_STRING:Ljava/lang/String; = ""

.field public static final NEWLINE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 37
    :try_start_0
    new-instance v2, Ljava/util/Formatter;

    invoke-direct {v2}, Ljava/util/Formatter;-><init>()V

    const-string v3, "%n"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Formatter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 42
    .local v1, "newLine":Ljava/lang/String;
    :goto_0
    sput-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    .line 43
    return-void

    .line 38
    .end local v1    # "newLine":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "\n"

    .restart local v1    # "newLine":Ljava/lang/String;
    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static split(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 5
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "delim"    # C

    .prologue
    .line 127
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 128
    .local v0, "end":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v2, "res":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 131
    .local v3, "start":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 132
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, p1, :cond_0

    .line 133
    if-ne v3, v1, :cond_1

    .line 134
    const-string v4, ""

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    :goto_1
    add-int/lit8 v3, v1, 0x1

    .line 131
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 136
    :cond_1
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 142
    :cond_2
    if-nez v3, :cond_4

    .line 143
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    :cond_3
    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v2, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    return-object v4

    .line 145
    :cond_4
    if-eq v3, v0, :cond_5

    .line 147
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 150
    :cond_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    :goto_3
    if-ltz v1, :cond_3

    .line 151
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3

    .line 152
    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 150
    add-int/lit8 v1, v1, -0x1

    goto :goto_3
.end method

.method public static split(Ljava/lang/String;CI)[Ljava/lang/String;
    .locals 6
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "delim"    # C
    .param p2, "maxParts"    # I

    .prologue
    .line 169
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 170
    .local v1, "end":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v3, "res":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 173
    .local v4, "start":I
    const/4 v0, 0x1

    .line 174
    .local v0, "cpt":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    if-ge v0, p2, :cond_2

    .line 175
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, p1, :cond_0

    .line 176
    if-ne v4, v2, :cond_1

    .line 177
    const-string v5, ""

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    :goto_1
    add-int/lit8 v4, v2, 0x1

    .line 182
    add-int/lit8 v0, v0, 0x1

    .line 174
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 179
    :cond_1
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 186
    :cond_2
    if-nez v4, :cond_4

    .line 187
    invoke-interface {v3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    :cond_3
    :goto_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    return-object v5

    .line 189
    :cond_4
    if-eq v4, v1, :cond_5

    .line 191
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 194
    :cond_5
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    :goto_3
    if-ltz v2, :cond_3

    .line 195
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_3

    .line 196
    invoke-interface {v3, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 194
    add-int/lit8 v2, v2, -0x1

    goto :goto_3
.end method

.method public static stripControlCharacters(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 57
    if-nez p0, :cond_0

    .line 58
    const/4 v0, 0x0

    .line 61
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/util/internal/StringUtil;->stripControlCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static stripControlCharacters(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 75
    if-nez p0, :cond_1

    .line 76
    const/4 p0, 0x0

    .line 117
    .end local p0    # "value":Ljava/lang/String;
    .local v1, "hasControlChars":Z
    .local v2, "i":I
    :cond_0
    :goto_0
    return-object p0

    .line 79
    .end local v1    # "hasControlChars":Z
    .end local v2    # "i":I
    .restart local p0    # "value":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 80
    .restart local v1    # "hasControlChars":Z
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .restart local v2    # "i":I
    :goto_1
    if-ltz v2, :cond_2

    .line 81
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 82
    const/4 v1, 0x1

    .line 87
    :cond_2
    if-eqz v1, :cond_0

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 92
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 95
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 96
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v4

    if-nez v4, :cond_5

    .line 103
    :cond_3
    const/4 v3, 0x0

    .line 104
    .local v3, "suppressingControlChars":Z
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_8

    .line 105
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 106
    const/4 v3, 0x1

    .line 104
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 80
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v3    # "suppressingControlChars":Z
    :cond_4
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 95
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 109
    .restart local v3    # "suppressingControlChars":Z
    :cond_6
    if-eqz v3, :cond_7

    .line 110
    const/4 v3, 0x0

    .line 111
    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    :cond_7
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 117
    :cond_8
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringAfter(Ljava/lang/String;C)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "delim"    # C

    .prologue
    .line 213
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 214
    .local v0, "pos":I
    if-ltz v0, :cond_0

    .line 215
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 217
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
