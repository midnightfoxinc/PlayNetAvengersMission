.class public final Lcom/ning/http/util/UTF8UrlEncoder;
.super Ljava/lang/Object;
.source "UTF8UrlEncoder.java"


# static fields
.field public static final BUILT_QUERY_UNTOUCHED_CHARS:Ljava/util/BitSet;

.field public static final FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

.field private static final HEX:[C

.field public static final RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

.field public static final RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/16 v6, 0x5f

    const/16 v5, 0x2e

    const/16 v4, 0x2d

    const/16 v3, 0x2a

    const/16 v2, 0x100

    .line 30
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    .line 31
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    .line 32
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->BUILT_QUERY_UNTOUCHED_CHARS:Ljava/util/BitSet;

    .line 34
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    .line 37
    const/16 v0, 0x61

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_0

    .line 38
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 39
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 37
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 41
    :cond_0
    const/16 v0, 0x41

    :goto_1
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_1

    .line 42
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 43
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 41
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 45
    :cond_1
    const/16 v0, 0x30

    :goto_2
    const/16 v1, 0x39

    if-gt v0, v1, :cond_2

    .line 46
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 47
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 49
    :cond_2
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 50
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 51
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 52
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x7e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 54
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v4}, Ljava/util/BitSet;->set(I)V

    .line 55
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v5}, Ljava/util/BitSet;->set(I)V

    .line 56
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v6}, Ljava/util/BitSet;->set(I)V

    .line 57
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    .line 59
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x21

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 60
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v3}, Ljava/util/BitSet;->set(I)V

    .line 61
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 62
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x28

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 63
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 64
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 65
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 66
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 67
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x26

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 68
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 69
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 70
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x24

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 71
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2c

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 72
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 73
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 74
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x23

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 75
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 76
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 78
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->BUILT_QUERY_UNTOUCHED_CHARS:Ljava/util/BitSet;

    sget-object v2, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 79
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->BUILT_QUERY_UNTOUCHED_CHARS:Ljava/util/BitSet;

    sget-object v2, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_RESERVED_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 80
    sget-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->BUILT_QUERY_UNTOUCHED_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x25

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 83
    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lcom/ning/http/util/UTF8UrlEncoder;->HEX:[C

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    return-void
.end method

.method private static appendEncoded(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/util/BitSet;Z)Ljava/lang/StringBuilder;
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "input"    # Ljava/lang/CharSequence;
    .param p2, "dontNeedEncoding"    # Ljava/util/BitSet;
    .param p3, "encodeSpaceAsPlus"    # Z

    .prologue
    .line 108
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 109
    invoke-static {p1, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 110
    .local v0, "c":I
    const/16 v2, 0x7f

    if-gt v0, v2, :cond_1

    .line 111
    invoke-virtual {p2, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 112
    int-to-char v2, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    :goto_1
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    .line 114
    :cond_0
    invoke-static {p0, v0, p3}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    goto :goto_1

    .line 116
    :cond_1
    invoke-static {p0, v0}, Lcom/ning/http/util/UTF8UrlEncoder;->appendMultiByteEncoded(Ljava/lang/StringBuilder;I)V

    goto :goto_1

    .line 118
    .end local v0    # "c":I
    :cond_2
    return-object p0
.end method

.method private static final appendMultiByteEncoded(Ljava/lang/StringBuilder;I)V
    .locals 2
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "value"    # I

    .prologue
    const/4 v1, 0x0

    .line 134
    const/16 v0, 0x800

    if-ge p1, v0, :cond_0

    .line 135
    shr-int/lit8 v0, p1, 0x6

    or-int/lit16 v0, v0, 0xc0

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    .line 136
    and-int/lit8 v0, p1, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    .line 147
    :goto_0
    return-void

    .line 137
    :cond_0
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_1

    .line 138
    shr-int/lit8 v0, p1, 0xc

    or-int/lit16 v0, v0, 0xe0

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    .line 139
    shr-int/lit8 v0, p1, 0x6

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    .line 140
    and-int/lit8 v0, p1, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    goto :goto_0

    .line 142
    :cond_1
    shr-int/lit8 v0, p1, 0x12

    or-int/lit16 v0, v0, 0xf0

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    .line 143
    shr-int/lit8 v0, p1, 0xc

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    .line 144
    shr-int/lit8 v0, p1, 0x6

    and-int/lit8 v0, v0, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    .line 145
    and-int/lit8 v0, p1, 0x3f

    or-int/lit16 v0, v0, 0x80

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V

    goto :goto_0
.end method

.method private static final appendSingleByteEncoded(Ljava/lang/StringBuilder;IZ)V
    .locals 2
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "value"    # I
    .param p2, "encodeSpaceAsPlus"    # Z

    .prologue
    .line 123
    const/16 v0, 0x20

    if-ne p1, v0, :cond_0

    if-eqz p2, :cond_0

    .line 124
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 131
    :goto_0
    return-void

    .line 128
    :cond_0
    const/16 v0, 0x25

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 129
    sget-object v0, Lcom/ning/http/util/UTF8UrlEncoder;->HEX:[C

    shr-int/lit8 v1, p1, 0x4

    aget-char v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 130
    sget-object v0, Lcom/ning/http/util/UTF8UrlEncoder;->HEX:[C

    and-int/lit8 v1, p1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x10

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 90
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {v0, p0}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static encodeAndAppendFormElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    .locals 2
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "input"    # Ljava/lang/CharSequence;

    .prologue
    .line 103
    sget-object v0, Lcom/ning/http/util/UTF8UrlEncoder;->FORM_URL_ENCODED_SAFE_CHARS:Ljava/util/BitSet;

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendEncoded(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/util/BitSet;Z)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static encodeAndAppendQuery(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 2
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 95
    sget-object v0, Lcom/ning/http/util/UTF8UrlEncoder;->BUILT_QUERY_UNTOUCHED_CHARS:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendEncoded(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/util/BitSet;Z)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    .locals 2
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "input"    # Ljava/lang/CharSequence;

    .prologue
    .line 99
    sget-object v0, Lcom/ning/http/util/UTF8UrlEncoder;->RFC3986_UNRESERVED_CHARS:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/ning/http/util/UTF8UrlEncoder;->appendEncoded(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/util/BitSet;Z)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method
