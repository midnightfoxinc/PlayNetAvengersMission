.class public final Lorg/jboss/netty/util/internal/ConversionUtil;
.super Ljava/lang/Object;
.source "ConversionUtil.java"


# static fields
.field private static final ARRAY_DELIM:Ljava/util/regex/Pattern;

.field private static final INTEGERS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 68
    const-string v0, "[, \\t\\n\\r\\f\\e\\a]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/util/internal/ConversionUtil;->ARRAY_DELIM:Ljava/util/regex/Pattern;

    .line 93
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "0"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "4"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "5"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "6"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "7"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "8"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "9"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "10"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "11"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "12"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "13"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "14"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "15"

    aput-object v2, v0, v1

    sput-object v0, Lorg/jboss/netty/util/internal/ConversionUtil;->INTEGERS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    return-void
.end method

.method public static toBoolean(Ljava/lang/Object;)Z
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 43
    instance-of v3, p0, Ljava/lang/Boolean;

    if-eqz v3, :cond_1

    .line 44
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 64
    .local v0, "s":Ljava/lang/String;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    :sswitch_0
    return v1

    .line 46
    .end local v0    # "s":Ljava/lang/String;
    :cond_1
    instance-of v3, p0, Ljava/lang/Number;

    if-eqz v3, :cond_2

    .line 47
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0

    .line 49
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 50
    .restart local v0    # "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3

    move v1, v2

    .line 51
    goto :goto_0

    .line 55
    :cond_3
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0

    .line 56
    :catch_0
    move-exception v3

    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    move v1, v2

    .line 64
    goto :goto_0

    .line 60
    nop

    :sswitch_data_0
    .sparse-switch
        0x54 -> :sswitch_0
        0x59 -> :sswitch_0
    .end sparse-switch
.end method

.method public static toInt(Ljava/lang/Object;)I
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 32
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 33
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 35
    .restart local p0    # "value":Ljava/lang/Object;
    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public static toString(I)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 99
    if-ltz p0, :cond_0

    sget-object v0, Lorg/jboss/netty/util/internal/ConversionUtil;->INTEGERS:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_0

    .line 100
    sget-object v0, Lorg/jboss/netty/util/internal/ConversionUtil;->INTEGERS:[Ljava/lang/String;

    aget-object v0, v0, p0

    .line 102
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static toStringArray(Ljava/lang/Object;)[Ljava/lang/String;
    .locals 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 74
    instance-of v3, p0, [Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 75
    check-cast p0, [Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    check-cast p0, [Ljava/lang/String;

    .line 90
    :goto_0
    return-object p0

    .line 78
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_0
    instance-of v3, p0, Ljava/lang/Iterable;

    if-eqz v3, :cond_3

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v0, "answer":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    check-cast p0, Ljava/lang/Iterable;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 81
    .local v2, "v":Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 82
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 84
    :cond_1
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 87
    .end local v2    # "v":Ljava/lang/Object;
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    move-object p0, v3

    goto :goto_0

    .line 90
    .end local v0    # "answer":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_3
    sget-object v3, Lorg/jboss/netty/util/internal/ConversionUtil;->ARRAY_DELIM:Ljava/util/regex/Pattern;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method
